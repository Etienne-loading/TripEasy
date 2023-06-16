class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :my_library]
  before_action :set_blog, only: [:show, :edit, :destroy, :update]

  def home
    @blogs = Blog.all.order(:id)
  end

  def my_library
    @blogs = current_user.blogs
    @blog = Blog.new
  end
end
