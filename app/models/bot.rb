require 'indico'

class Bot < ActiveRecord::Base
  belongs_to :user
  has_many :bots_interactions
  has_many :interactions, through: :bots_interactions

  validates :name, presence: true
  validates :gender, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :age, numericality: { less_than_or_equal_to: 99 }
  validates :eye_color, presence: true
  validates :hair_color, presence: true
  validates :user_id, presence: true

  UNKNOWN_MESSAGE = [
    "I'm not sure what you mean",
    "mm..a...What do you mean?",
    "I don't understand what you are saying but you are great anyway :)"
  ]

  def avatar
    gender + "-" + hair_color + "-" + eye_color + ".png"
  end

  def send_welcome_message
    welcome_message = "Welcome to your new BAE! I'm #{self.name} and I can't wait to talk to you, #{self.user.username}! :)"
    send_message(user.full_phone_number, welcome_message)
  end

  def send_message(recipient_phone, body)
    twilio_number = ENV["TWILIO_PHONE_NUMBER"]
    client = Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"]
    )
    client.account.messages.create(
      from: "#{twilio_number}",
      to: recipient_phone,
      body: body
    )
  end

  def self.reply_body(params)
    message_sender = params[:From]
    message_body = params[:Body]
    user = User.find_by(phone_number: message_sender.sub("+1", ""))

    reply_body = user.bots[0].right_answer(message_body)

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

  def sentiment?(message)
    Indico.api_key = ENV["INDICO"]
    if Indico.sentiment_hq(message) > 0.65
      "Positive"
    elsif Indico.sentiment_hq(message) >= 0.25
      "Neutral"
    else
      "Negative"
    end
  end
  
  def right_answer(message)
    bot_interactions = self.interactions
    keywords = message.split(/\W+/)
    new_response = ""

    bot_interactions.each do |interaction|
      if interaction.sentence == message
        new_response = interaction.response
      elsif keywords.include?(interaction.keyword1) && interaction.keyword2.nil? && interaction.sentiment == sentiment?(message)
        new_response = interaction.response
      elsif keywords.include?(interaction.keyword1) && keywords.include?(interaction.keyword2) && interaction.sentiment == sentiment?(message)
        new_response = interaction.response
      end
    end

    if new_response == ""
      new_response = UNKNOWN_MESSAGE.shuffle.sample
    else
      new_response
    end
  end

end
