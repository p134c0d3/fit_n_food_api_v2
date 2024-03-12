class Profile < ApplicationRecord
  
  # validations
  validates :goals, presence: true
  validates :bio, presence: true
  
  # associations
  belongs_to :user
end
