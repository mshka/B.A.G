class ReviewsController < ApplicationController

  def index
    @reviews = Review.where("reviews.restaurant_id = #{current_restaurant.id} AND reviews.viewed_by_place = #{false}")
    @reviews.each do |review|
      review.viewed_by_place = true
      review.save
    end
  end

  def create
    @review = Review.new
    @review.content = review_params[:content]
    @review.rating = review_params[:rating].to_i
    @review.user_id = review_params[:user_id]
    @review.restaurant_id = review_params[:restaurant_id]
    @review.save
    redirect_to restaurant_path(review_params[:restaurant_id])


  end

  def destroy
    @review = Review.find(params[:id])
    @restaurant_id = @review.restaurant_id

    @review.destroy
    redirect_to restaurant_path(@restaurant_id)
  end


  private


  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :restaurant_id)
  end
end