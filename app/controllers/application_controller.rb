class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :show, :search, :index, :barter, :want]
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name])
  end
  
end
