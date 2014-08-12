class ApplicationController < ActionController::Base
  include I18nExtension
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
    def current_user
      @current_user ||= session[:user_id] && User.find(session[:user_id])
    end
end
