class Food < ApplicationRecord
  
  # validations
  validates :food_name, presence: true
  validates :calories, presence: true
  
  # associations
  belongs_to :user
end
