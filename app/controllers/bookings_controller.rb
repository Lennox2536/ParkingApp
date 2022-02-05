class BookingsController < ApplicationController
  before_action :ensure_logged_in

  def bookings_history; end

  def my_booking; end

  def release
    if ReleaseService.perform(@user, params[:number])
      flash.notice = "You've released place"
    else
      flash.alert = 'Something went wrong'
    end

    redirect_to '/'
  end
end

