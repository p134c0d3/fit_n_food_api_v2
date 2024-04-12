require 'rails_helper'

RSpec.describe Water, type: :model do
  context 'Validation Tests' do
    it 'is not valid without ounces' do 
      user = User.create(email: 'QpS5B@example.com', first_name: 'John')
      water = Water.create(user: user)
      expect(water).to_not be_valid
      expect(water.errors[:ounces]).to include("can't be blank")
    end
  end
end
