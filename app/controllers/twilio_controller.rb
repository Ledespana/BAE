require "twilio-ruby"

class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def answer
    Bot.reply_body(params)
    render plain: ""
  end
end
