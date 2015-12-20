class Interaction < ActiveRecord::Base
  has_many :bots_interactions
  has_many :bots, through: :bots_interactions

  belongs_to :user
  validates :user_id, presence: true

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

  def self.values_to_downcase(params)
    if !params["interaction"]["sentence"].nil?
      params["interaction"]["sentence"].downcase!
    elsif !params["interaction"]["keyword1"].nil? && !params["interaction"]["keyword2"].nil?
      params["interaction"]["keyword1"].downcase!
      params["interaction"]["keyword2"].downcase!
    elsif !params["interaction"]["keyword1"].nil?
      params["interaction"]["keyword1"].downcase!
    end
  end


end
