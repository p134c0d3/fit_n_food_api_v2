class User < ApplicationRecord
  # validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { minimum: 5, maximum: 255 }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }

  # associations
  has_many :workouts, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :waters, dependent: :destroy
  has_one :profile, dependent: :destroy
end
