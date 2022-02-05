class SlackController < ActionController::Base
  class UnauthorizedRequestException < StandardError; end
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_signature

  rescue_from UnauthorizedRequestException do
    json = { text: 'Unauthorized' }
    render json: json
  end

  def book
    if BookingService.perform(user, params['text'].to_i)
      json = { text: "You've booked the place."}
    else
      json = { text: 'Something went wrong.'}
    end

    render json: json
  end

  def release
    if ReleaseService.perform(user, params['text'].to_i)
      json = { text: "You've released the place."}
    else
      json = { text: 'Something went wrong.'}
    end

    render json: json
  end

  def place_status
    place = Place.find_by(number: params['text'].to_i)

    if place
      if place.free?
        json = { text: 'Place is free.'}
      else
        user_name = place.bookings.active.first.user.name
        name_to_call = user_name.eql?(params['user_id']) ? 'you' : user_name
        json = { text: "Place is taken by #{name_to_call}." }
      end
    else
      json = { text: 'Something went wrong.'}
    end

    render json: json
  end

  private

  def user
    user = User.find_by(slack_id: params['user_id'])
    user ||= User.create(slack_id: params['user_id'], name: params['user_name'])
    user
  end

  def verify_slack_signature
    timestamp = request.headers['X-Slack-Request-Timestamp']
    if (Time.now.to_i - timestamp.to_i).abs > 60 * 5
      raise UnauthorizedRequestException
    end

    sig_basestring = "v0:#{timestamp}:#{request.raw_post}"
    signature = "v0=#{OpenSSL::HMAC.hexdigest('SHA256', ENV['SIGNING_SECRET'], sig_basestring)}"
    slack_signature = request.headers['X-Slack-Signature']

    raise UnauthorizedRequestException unless signature == slack_signature
  end
end
