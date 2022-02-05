class RequestService
  class << self
    def request_body(path, params, include_token: false)
      params = include_token ? {}.merge!({ token: ENV['USER_TOKEN'] }, params) : params
      res = Net::HTTP.post_form(URI("https://slack.com/#{path}"), params)
      res.body if res.code == '200'
    end
  end
end
