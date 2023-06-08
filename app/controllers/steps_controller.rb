class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  before_action :set_blog, only: [:create, :index, :new]

  def index
    skip_policy_scope
    @steps = @blog.steps
    @step = Step.new
  end

  def show
  end

  def new
    @step = Step.new
  end

  def create
    skip_authorization
    @step = Step.new(step_params)
    @step.blog = @blog
    if @step.save
      redirect_to blog_steps_path
    else
      render edit_blog_step_path, status: :unprocessable_entity
    end
  end

  def edit
    skip_authorization
  end

  def update
    skip_authorization
    @step.update(step_params)
    redirect_to blog_steps_path
  end

  def destroy
    skip_authorization
    @step.destroy
    redirect_to blog_steps_path, status: :see_other
  end

  private

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:title, :address, :content, :duration, :latitude, :longitude, :country, :photo)
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
