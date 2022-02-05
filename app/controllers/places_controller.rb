class PlacesController < ApplicationController
  before_action :ensure_logged_in, only: :book

  def index; end

  def show; end

  def book
    if BookingService.perform(@user, params[:place])
      flash.notice = 'Booked a place'
    else
      flash.alert = 'Something went wrong'
    end

    redirect_to '/'
  end
end
