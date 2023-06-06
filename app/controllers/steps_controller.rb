class StepsController < ApplicationController
  before_action :set_step

  def index
    @steps = Step.all
  end

  def show
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.save
    redirect_to blog_path(@step)
  end

  def edit
  end

  def destroy
    @step.destroy
    redirect_to edit_path, status: :see_other
  end

  private

  def set_blog
    @step = Step.find(params[:id])
  end

  def blog_params
    params.require(:step).permit(:title, :address, :city, :content, :duration, :latitude, :longitude, :country)
  end
end
