class PlacesController < ApplicationController
  def index
    places = Place.all
    render json: places
  end

  def show
    place_id = params[:id]
    place = Place.find(place_id)
    render json: place
  end

  def create
    place = Place.new(
      name: params[:name],
      address: params[:address],
    )
    if place.save
      render json: place
    else
      render json: { errors: place.errors.full_messages }, status: 422
    end
  end

  def update
    place_id = params[:id]
    place = Place.find(place_id)
    place.name = params[:name] || place.name
    place.address = params[:address] || place.address
    if place.save
      render json: place
    else
      render json: { errors: place.errors.full_messages }, status: 422
    end
  end

  def destroy
    place_id = params[:id]
    place = Place.find(place_id)
    place.destroy
    render json: { message: "Place destroyed successfully" }
  end
end
