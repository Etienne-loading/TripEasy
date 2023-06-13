class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :destroy, :update]
  def index
    @blogs = policy_scope(Blog)
    if params[:query].present?
      @blogs = @blogs.global_search(params[:query])
    end
  end

  def show
    authorize @blog
    @steps = @blog.steps
    @steps = @steps.order(:id)

    @markers = @steps.geocoded.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude,
        info_window_html: render_to_string(partial: "steps/info_window", locals: {step: step})
      }
    end
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
    @step = Step.new
    @steps = @blog.steps
  end

  def update
    authorize @blog
    @blog.update(blog_params)
    redirect_to blog_steps_path(@blog)
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
    params.require(:blog).permit(:title, :max_price, :min_price, :start_date, :end_date, :carbon_friendly, :photo_banner, :video)
  end
end
