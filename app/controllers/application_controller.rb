class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: :username)
    # devise_parameter_sanitizer.permit(:account_update, keys: [:addsomething])
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
