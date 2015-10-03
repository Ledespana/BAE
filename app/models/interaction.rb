class Interaction < ActiveRecord::Base
  has_and_belongs_to_many :bots

  validates :category, presence: true
  validates :response, presence: true
end
