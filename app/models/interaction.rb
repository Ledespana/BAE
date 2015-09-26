class Interaction < ActiveRecord::Base
  belongs_to :bot

  validates :keyword1, presence: true
  validates :response, presence: true
  validates :bot_id, presence: true
end
