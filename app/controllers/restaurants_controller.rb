class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @opening_days_hours =  JSON.parse(@restaurant.opening_days_hours)
    @reviews = Review.where("reviews.restaurant_id = #{params[:id]}")
    @reviews_count = @reviews.count
    @restaurant_ratings = []

    @reviews.each do |rev|
      @restaurant_ratings << rev.rating
    end
    @restaurant_ratings = @restaurant_ratings.inject{ |sum, el| sum + el }.to_f / @restaurant_ratings.size

    if current_user != nil
      @user_review = Review.where("reviews.user_id = #{current_user.id } AND reviews.restaurant_id = #{params[:id]}")
      @review = Review.new
      @reviews = @reviews - @user_review

      if @reviews == []
        @reviews = [0]
      end

    end

  end
end
