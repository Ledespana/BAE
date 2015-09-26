class Bot < ActiveRecord::Base
  belongs_to :user
  has_many :interactions, dependent: :destroy

  validates :name, presence: true
  validates :eye_color, presence: true
  validates :hair_color, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :age, numericality: { less_than_or_equal_to: 99 }
  validates :user_id, presence: true

end
