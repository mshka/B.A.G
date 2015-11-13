class PagesController < ApplicationController
  def home

  end

  def search
    search_value = params["searchvalue"]
    @search_result = Restaurant.where("email iLIKE '%#{search_value}%' OR name iLIKE '%#{search_value}%' OR address iLIKE '%#{search_value}%' OR phone_number iLIKE '%#{search_value}%' OR website_url iLIKE '%#{search_value}%' OR facebook_page iLIKE '%#{search_value}%' OR twitter_handle iLIKE '%#{search_value}%' OR opening_days_hours iLIKE '%#{search_value}%' OR description iLIKE '%#{search_value}%' OR category iLIKE '%#{search_value}%'")
  end

  def my_profile
    @user = current_user
  end


  def establishment_home_porfile
    @establishment = current_restaurant
  end
end
