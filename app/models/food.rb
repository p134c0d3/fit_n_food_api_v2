class Food < ApplicationRecord
  belongs_to :user

  validates :food_name, presence: true
  validates :calories, presence: true
end
