class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { minimum: 5, maximum: 255 }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }

  # associations
  has_many :workouts
  has_many :foods
  has_many :waters
  has_one :profile
end
