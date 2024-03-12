class Profile < ApplicationRecord
  belongs_to :user

  validates :goals, presence: true
  validates :bio, presence: true
end
