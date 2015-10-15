class User < ActiveRecord::Base
  has_many :bots
  has_many :interactions


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_picture, ProfilePictureUploader

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :phone_number, uniqueness: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates_length_of :phone_number, is: 10
  validates :role, presence: true


  def self.search(query)
    where("username ILIKE ?", "%#{query}%")
  end

  def full_phone_number
    "+1#{phone_number}"
  end
end
