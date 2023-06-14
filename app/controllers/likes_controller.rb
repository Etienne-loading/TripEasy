class LikesController < ApplicationController
  before_action :set_blog
  before_action :set_like, only: [:show,:crate, :destroy]


  def new
    @like = Like.new
  end

  def create
    skip_authorization
    if already_liked?
      nil
    else
      @like = Like.new(user_id: current_user.id)
      @like.blog = @blog
      @like.save
    end
    redirect_to blog_path(@blog)
  end

  def destroy
    if already_liked?
      @like = Like.find(params[:id])
      @like.destroy
      skip_authorization
    else
      redirect_to blog_path(params[:blog_id])
    end
    redirect_to blog_path(params[:blog_id])
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, blog_id: params[:blog_id]).exists?
  end

  def set_blog
    @blog = Blog.find_by(id: params[:blog_id])
    redirect_to root_path, notice: "Le blog est introuvable." unless @blog
  end

  def set_like
    if @blog.likes.present?
      @like = @blog.likes.find(params[:id])
    else
      redirect_to blog_path
    end
  end
end
