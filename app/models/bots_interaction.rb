class BotsInteraction < ActiveRecord::Base
  belongs_to :bot
  belongs_to :interaction

  validates :bot_id, presence: true
  validates :interaction_id, presence: true
end
