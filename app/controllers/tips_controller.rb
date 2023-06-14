class TipsController < ApplicationController
  before_action :set_step, only: [:create, :index, :new]
  before_action :set_blog, only: [:create, :index, :new]
  before_action :set_tip, only: [:destroy]


  def index
    @tips = Tips.all
  end

  def show
    @tip = Tip.find(params[:id])
  end

  def new
    @tip = Tip.new
  end

  def create
    skip_authorization
    @tip = Tip.new(tip_params)
    @tip.step = @step
    if @tip.save
      redirect_to blog_steps_path(@blog)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    skip_authorization
    @tip.destroy
    redirect_to blog_steps_path(params[:blog_id])
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_step
    @step = Step.find(params[:step_id])
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def tip_params
    params.require(:tip).permit(:title, :content, :link, :category)
  end
end
