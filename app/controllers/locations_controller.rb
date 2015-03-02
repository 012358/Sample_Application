class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 240)
    else
      @locations = Location.all
    end
    end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    @location.save
    redirect_to @location
  end

  def update
    @location.update(location_params)
  end

  def destroy
    @location.destroy
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end
end
