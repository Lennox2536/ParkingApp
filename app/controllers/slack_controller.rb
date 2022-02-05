class SlackController < ApplicationController
  skip_before_action :set_current_user

  def book
    puts params
  end
end
