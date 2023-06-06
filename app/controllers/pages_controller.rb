class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :my_library]

  def home
  end

  def my_library
    @blogs = current_user.blogs
    @blog = Blog.new
  end
end
