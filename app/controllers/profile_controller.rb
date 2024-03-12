class ProfileController < ApplicationController
  def index
    profiles = Profile.all 

    render json: profiles, status: 200
  end

  def show 
    user = User.find(params[:id])
    profile = user.profile

    render json: profile, status: 200
  end
end
