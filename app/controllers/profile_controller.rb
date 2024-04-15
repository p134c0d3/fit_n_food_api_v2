class ProfileController < ApplicationController
  before_action :set_profile, only: %i[update destroy show]
  
  def create
    profile = Profile.new(profile_params)

    if profile.save
      render json: profile, status: :created
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(profile_params)
      render json: @profile, status: :ok

    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @profile.destroy
      render json: nil, status: :ok
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.permit(:goals, :bio, :user_id, :id)
  end
end
