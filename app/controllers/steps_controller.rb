class StepsController < ApplicationController
  before_action :set_blog, only: [:create, :index, :new]


  def index
    skip_policy_scope
    @blog = Blog.find(params[:blog_id])
    @steps = @blog.steps
    @step = Step.new
  end

  def show
    @step = Step.find(params[:id])
  end

  def new
    @step = Step.new
  end

  def create
    skip_authorization
    @blog = Blog.find(params[:blog_id])
    @step = @blog.steps.build(step_params)
    tags = params[:step][:tag_list].split(',') if tags
    @step.tag_list.add(tags)
    if @step.save
      redirect_to blog_steps_path(@blog)
    else
      @steps = @blog.steps.order(:id)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    skip_authorization
    @step = Step.find(params[:id])
  end

  def update
    skip_authorization
    @step = Step.find(params[:id])
    @step.update(step_params)

    if @step.update(step_params)
      @step.tag_list.remove(params[:step][:tag_list])
      redirect_to blog_steps_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    skip_authorization
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to blog_steps_path, status: :see_other
  end

  private

  def step_params
    params.require(:step).permit(:title, :address, :content, :duration, :latitude, :longitude, :country, :layout, :photo_text, :name,:tags,:tag_list, photos: [])
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
