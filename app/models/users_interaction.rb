class UsersInteraction < ActiveRecord::Base
  belongs_to :user
  belongs_to :interaction

  validates :user_id, presence: true
  validates :interaction_id, presence: true
end
