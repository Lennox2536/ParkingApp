class UserProvider
  class << self
    def retrieve_user(code)
      body = RequestService.request_body('api/oauth.v2.access',
                                         { code: code, client_id: ENV['CLIENT_ID'],
                                           client_secret: ENV['CLIENT_SECRET'], redirect_uri: 'https://parking-app-rails.herokuapp.com/auth/slack/callback' })
      data = JSON.parse(body)
      puts data
      user_id = data['authed_user']['id'] if data.key?('authed_user')
      user_name = user_name(user_id)
      User.new(name: user_name, slack_id: user_id)
    end

    private

    def user_name(user_id)
      body = RequestService.request_body( 'api/users.info', { user: user_id }, include_token: true)
      data = JSON.parse(body)
      data['user']['name'] if data.key?('user')
    end
  end
end
