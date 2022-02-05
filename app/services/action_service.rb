class ActionService
  class << self
    def perform(user_data, place_number)
      raise NotImplementedError
    end

    protected

    def user(user_data)
      if user_data.class.name.to_s.eql?('User')
        user_data
      else
        User.find_by(slack_id: user_data)
      end
    end

    def place(place_number)
      Place.find_by(number: place_number)
    end
  end
end

