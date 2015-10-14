require "twilio-ruby"

class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :hook

  def answer
    Bot.reply_body(params)
    render plain: ""
  end
end
