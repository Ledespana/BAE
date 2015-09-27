class Interaction < ActiveRecord::Base
  belongs_to :bot

  validates :category, presence: true
  validates :response, presence: true
  validates :bot_id, presence: true

end
