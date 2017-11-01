class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  #define require_sign_in to redirect un-signed-in users. we define it here because we'll eventually call it from other controllers
  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      #redirect un-signed-in users to sign-in page
      redirect_to new_session_path
      end
    end
end
