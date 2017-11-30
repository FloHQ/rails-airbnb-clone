class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :age, :gender, :profile_picture, :appartment_equipment, :appartment_rules, :appartment_address, :appartment_photo, :short_description])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :phone_number, :age, :gender, :profile_picture, :appartment_equipment, :appartment_rules, :appartment_address, :appartment_photo, :short_description])
  end
end
