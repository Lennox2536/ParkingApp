class SlackController < ApplicationController
  skip_before_action :set_current_user, :verify_authenticity_token

  def book
    if BookingService.perform(user, params["text"].to_i)
      json = { text: "You've booked the place."}
    else
      json = { text: "Something went wrong."}
    end

    render json: json
  end

  def release
    if ReleaseService.perform(user, params["text"].to_i)
      json = { text: "You've released the place."}
    else
      json = { text: "Something went wrong."}
    end

    render json: json
  end

  def place_status
    place = Place.find_by(number: params["text"].to_i)

    if place
      if place.free?
        json = { text: 'Place is free.'}
      else
        user_name = place.bookings.active.first.user.name
        json = { text: "Place is taken by #{user_name}."}
      end
    else
      json = { text: 'Something went wrong.'}
    end

    render json: json
  end

  private

  def user
    user = User.find_by(slack_id: params["user_id"])
    user ||= User.create(slack_id: params["user_id"], name: params["user_name"])
    user
  end
end
