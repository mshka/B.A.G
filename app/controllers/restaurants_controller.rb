class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @opening_days_hours =  JSON.parse(@restaurant.opening_days_hours)
    if current_user != nil
      @user_review = Review.where("reviews.user_id = #{current_user.id } AND reviews.restaurant_id = #{params[:id]}")
      @review = Review.new
    end

  end
end
