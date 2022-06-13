class ApplicationController < ActionController::API
  respond_to :json

  before_action :doorkeeper_authorize!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def current_user
      @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
    end
end
