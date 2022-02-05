class SlackController < ApplicationController
  skip_before_action :set_current_user, :verify_authenticity_token

  def book
    user = User.find_by(slack_id: params["user_id"])
    user ||= User.create(slack_id: params["user_id"], name: params["user_name"])
    
    if BookingService.perform(user, params["text"].to_i)
      json = { text: "You've booked the place."}
    else
      json = { text: "Something went wrong."}
    end

    render json: json
  end
end
