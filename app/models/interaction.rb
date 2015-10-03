class Interaction < ActiveRecord::Base
  has_many :bots_interactions
  has_many :bots, through: :bots_interactions

  validates :category, presence: true
  validates :response, presence: true
end
