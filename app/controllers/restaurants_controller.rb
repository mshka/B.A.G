class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @opening_days_hours =  JSON.parse(@restaurant.opening_days_hours)
  end
end
