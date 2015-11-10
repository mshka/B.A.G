class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?


  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :picture, :email, :password, :password_confirmation, :name, :address, :phone_number, :website_url, :facebook_page, :twitter_handle, :opening_days_hours, :description, :category, :cover_picture, :menu_picture, :item_picture]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end
end
