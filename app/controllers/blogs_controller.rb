class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :destroy]
  def index
    @blogs = policy_scope(Blog)
  end

  def show
    authorize @blog
  end

  def new
    @blog = Blog.new
    authorize @blog
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    authorize @blog
    if @blog.save
      redirect_to my_library_path
    else
      render 'pages/my_library', status: :unprocessable_entity
    end
  end

  def edit
    authorize @blog
  end

  def destroy
    authorize @blog
    @blog.destroy
    redirect_to my_library_path, status: :see_other
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :max_price, :min_price, :start_date, :end_date, :carbon_friendly)
  end
end
