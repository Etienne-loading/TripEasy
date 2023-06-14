class TipsController < ApplicationController
  before_action :set_trip, only: [:show]

  def index
    @tips = Tips.all
  end

  def show
  end

  def new
    @tip = Tips.new
  end

  def create
    @tip = Tips.new(trip_params)
    @tip.save
    redirect_to blog_path(@tip)
  end

  def edit
  end

  def destroy
    @tip.destroy
    redirect_to edit_path, status: :see_other
  end

  private

  def set_blog
    @tip = Tips.find(params[:id])
  end


end
