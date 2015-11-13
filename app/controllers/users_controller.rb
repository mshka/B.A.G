class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.where("user_id = #{@user.id}")
    @booking = Booking.where("user_id = #{@user.id}")
  end

  def edit
  end

  def update
  end
end
