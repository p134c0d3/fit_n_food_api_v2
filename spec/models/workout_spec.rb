require 'rails_helper'

RSpec.describe Workout, type: :model do 
    context 'Validation Tests' do
      it 'is not valid without a name' do 
        user = User.create(email: 'QpS5B@example.com', first_name: 'John')
        workout = Workout.create(sets: 5, reps: 10, calories_burned: 200, user: user)
        expect(workout).to_not be_valid
        expect(workout.errors[:workout_name]).to include("can't be blank")
      end

      it 'is not valid without sets' do 
        user = User.create(email: 'QpS5B@example.com', first_name: 'John')
        workout = Workout.create(workout_name: 'Workout 1', reps: 10, calories_burned: 200, user: user)
        expect(workout).to_not be_valid
        expect(workout.errors[:sets]).to include("can't be blank")
      end
    end
end
