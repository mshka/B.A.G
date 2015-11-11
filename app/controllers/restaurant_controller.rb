class RestaurantController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_restaurant.update(restaurant_params)
      redirect_to restaurant_path(current_restaurant.id)
    else
      render :edit
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :website_url, :facebook_page, :twitter_handle, :opening_days_hours, :description, :category, :menu_picture, :item_picture, :cover_picture)
  end
end
