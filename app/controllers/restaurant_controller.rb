class RestaurantController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_restaurant.update(restaurant_params)
      redirect_to my_establishment_profile_path
    else
      render :edit
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :website_url, :facebook_page, :twitter_handle, :opening_days_hours, :description, :category, :menu_picture, :item_picture)
  end
end
