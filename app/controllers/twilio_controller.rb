require "twilio-ruby"

class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def answer
    Bot.route_incoming(params)
    render text: ""
  end
end
