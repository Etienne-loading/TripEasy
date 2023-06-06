class TagsController < ApplicationController
  def create
    @tag = Tag.new(tags_param)
    @booking = Step.find(params[:step_id])
    @tag.name = @tag
    if @tag.save
      redirect_to step_path(current_user)
    else
      render "profiles/show", status: :unprocessable_entity
    end
  end

  private

  def tags_param
    params.require(:review).permit(:name)
  end
end
