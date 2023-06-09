class StepsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_blog, only: [:create, :index, :new, :update]


  def index
    skip_policy_scope
    @blog = Blog.find(params[:blog_id])
    @tips = Tip.all
    @tip = Tip.new
    @steps = @blog.steps.order(:id)
    @step = Step.new
  end

  def show
    skip_authorization
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
      redirect_to blog_steps_path(@blog, anchor: @step.id)
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

    # respond_to do |format|
    #   format.html { redirect_to blog_steps_path }
    #   format.text { render partial: "steps/index", locals: {step: @step}, formats: [:html] }
    #   raise
    # end

    if @step.update(step_params)
      @step.tag_list.remove(params[:step][:tag_list])
      redirect_to blog_steps_path(@blog, anchor: @blog.previous_step(@step).id)
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
