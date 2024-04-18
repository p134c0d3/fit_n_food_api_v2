# frozen_string_literal: true

class WorkoutsBlueprint < Blueprinter::Base
  identifier :id 
  fields :user_id, :workout_name, :sets, :reps, :calories_burned, :created_at

  view :normal do 
    association :user, blueprint: UserBlueprint, view: :workouts
  end
end
