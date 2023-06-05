class BlogsController < ApplicationController
  before_action :set_blog
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    redirect_to blog_path(@blog)
  end

  def edit
  end

  def destroy
    @blog.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :max_price, :min_price, :start_date, :end_date, :carbon_friendly)
  end
end
