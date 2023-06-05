class TripsController < ApplicationController
  before_action :set_trip, only: [:show]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.save
    redirect_to blog_path(@trip)
  end

  def edit
  end

  def destroy
    @trip.destroy
    redirect_to edit_path, status: :see_other
  end

  private

  def set_blog
    @trip = Trip.find(params[:id])
  end

  def blog_params
    params.require(:trip).permit(:title, :city, :content, :duration, :latitude, :longitude, :country)
  end
end
