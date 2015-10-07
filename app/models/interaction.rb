class Interaction < ActiveRecord::Base
  has_many :bots_interactions
  has_many :bots, through: :bots_interactions

  has_many :users_interactions, dependent: :destroy
  has_many :users, through: :users_interactions, dependent: :destroy

  validates :category, presence: true
  validates :response, presence: true
end
