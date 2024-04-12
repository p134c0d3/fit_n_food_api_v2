require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'Validation Tests' do
    it 'is not valid without bio' do
      user = User.create(email: 'QpS5B@example.com', first_name: 'John')
      profile = Profile.create(goals: 'lose weight', user: user)
      expect (profile).to_not be_valid
      expect (profile.errors[:bio]).to include("can't be blank")
    end

    it 'is not valid without goals' do
      user = User.create(email: 'QpS5B@example.com', first_name: 'John')
      profile = Profile.create(bio: 'I am a bio', user: user)
      expect(profile).to_not be_valid
      expect(profile.errors[:goals]).to include("can't be blank")
    end
  end
end
