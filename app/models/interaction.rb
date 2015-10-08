class Interaction < ActiveRecord::Base
  has_many :bots_interactions
  has_many :bots, through: :bots_interactions

  has_many :users_interactions, dependent: :destroy
  has_many :users, through: :users_interactions, dependent: :destroy

  validates :category, presence: true
  validates :response, presence: true
  validate :one_of_three_interactions

  def one_of_three_interactions
    if category == "Sentence" && sentence.blank?
      errors.add(:sentence, "You need to fill the sentence field")
    elsif category == "Keyword" && keyword1.blank?
      errors.add(:keyword1, "You need to fill the keyword field")
    elsif category == "Combo" && keyword1.blank?
      errors.add(:keyword1, "You need to fill the form")
    elsif category == "Combo" && keyword2.blank?
      errors.add( :keyword2, "You need to fill the form")
    elsif category == "Combo" && keyword1.blank? && keyword2.blank?
      errors.add(:keyword1, :keyword2, "You need to fill the form")
    end
  end
end
