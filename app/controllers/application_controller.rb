class ApplicationController < ActionController::Base

  include CanCan::ControllerAdditions
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Access denied."
    redirect_to root_url
  end

end


# class ApplicationController < ActionController::API
#   include CanCan::ControllerAdditions
# end