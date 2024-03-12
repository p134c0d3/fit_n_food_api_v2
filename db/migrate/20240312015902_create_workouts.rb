class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :workout_name
      t.integer :sets
      t.integer :reps
      t.integer :calories_burned

      t.timestamps
    end
  end
end
