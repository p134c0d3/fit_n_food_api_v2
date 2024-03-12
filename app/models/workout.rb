class Workout < ApplicationRecord
  
  # validations
  validates :workout_name, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
  validates :calories_burned, presence: true

  # associations
  belongs_to :user
end
