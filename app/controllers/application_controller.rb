class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  helper_method :current_user_information

  load_and_authorize_resource :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    # render :text => "You have no access - go back"
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

  def current_user_information
    @user ||= User.last.email
    testing
  end

  def testing
    @user ||= User.last.email
  end
end
