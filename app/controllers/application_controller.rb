class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_title, :set_time
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:user_name, 
      :full_name, :re_system_type, :init_kwh_reading]
  end
  
  private

  def set_time
  	@time = Time.now
  end

  def set_title
  	@title = 'Carbon Club'
  end


end