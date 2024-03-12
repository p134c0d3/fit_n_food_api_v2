class Workout < ApplicationRecord
  belongs_to :user

  validates :workout_name, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
  validates :calories_burned
end
