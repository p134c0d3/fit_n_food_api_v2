require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'Validation Tests' do
    it 'is not valid without name' do
      user = User.create(email: 'QpS5B@example.com', first_name: 'John')
      food = Food.create(calories: 200, user: user)
      expect(food).to_not be_valid
      expect(food.errors[:food_name]).to include("can't be blank")
    end

    it 'is not valid without calories' do
      user = User.create(email: 'QpS5B@example.com', first_name: 'John')
      food = Food.create(food_name: 'Food 1', user: user)
      expect(food).to_not be_valid
      expect(food.errors[:calories]).to include("can't be blank")
    end
  end
end
