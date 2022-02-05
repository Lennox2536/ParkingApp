class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!@user
  end

  def ensure_logged_in
    unless logged_in?
      flash.alert = 'You must be logged in'
      redirect_to '/'
    end
  end
end
