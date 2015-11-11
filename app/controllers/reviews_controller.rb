class ReviewsController < ApplicationController
  def create
    @review = Review.new
    @review.content = review_params[:content]
    @review.rating = review_params[:rating].to_i
    @review.user_id = review_params[:user_id]
    @review.restaurant_id = review_params[:restaurant_id]
    if @review.save
      redirect_to restaurant_path(review_params[:restaurant_id])

    else
      render :edit

    end
  end

  def destroy

  end


  private


  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :restaurant_id)
  end
end
