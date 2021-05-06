class ApplicationController < ActionController::Base
  include SessionsHelper

  def admin_log_in
    unless logged_in? && admin_user?
      flash[:danger] = "You are not authorized."
      if logged_in?
        redirect_to root_url
      else
        redirect_to login_url
      end
      # what will happen if user is not an admin
    end
  end
end
