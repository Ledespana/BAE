require "twilio-ruby"

class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def answer
    message_sender = params[:From]
    message_body = params[:Body]
    UNKNOWN_COMMAND_MESSAGE = "This is a test"

    user = User.find_by(phone_number: message_sender.sub("+1", ""))

    reply_body = UNKNOWN_COMMAND_MESSAGE
    twilio_number = ENV["TWILIO_PHONE_NUMBER"]
    client = Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"]
    )
    client.account.messages.create(
      from: "#{twilio_number}",
      to: user.full_phone_number,
      body: reply_body
    )
  end
end
