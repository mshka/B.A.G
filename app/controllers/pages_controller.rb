class PagesController < ApplicationController
  def home

  end

  def search
  end

  def my_profile
    @user = current_user
  end


  def establishment_home_porfile
    @establishment = current_restaurant
  end
end
