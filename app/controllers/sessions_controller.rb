require 'net/http'
require 'json'

class SessionsController < ApplicationController
  before_action :ensure_logged_in, only: :log_out

  def create
    user = UserProvider.retrieve_user(params[:code])
    puts "inside create"
    maybe_user = User.find_by(slack_id: user.slack_id)
    if maybe_user
      session[:user_id] = maybe_user.id
    else
      if user.save
        session[:user_id] = user.id
      else
        flash.alert = "Something went wrong"
        redirect_to '/' and return
      end
    end

    flash.notice = "Succesfully logged in."
    redirect_to '/'
  end

  def log_out
    session[:user_id] = nil
    flash.notice = "Logged out"
    redirect_to '/'
  end
end

