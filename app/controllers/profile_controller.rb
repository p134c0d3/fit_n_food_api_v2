class ProfileController < ApplicationController
  before_action :set_profile, only: %i[update destroy show]
  before_action :authenticate_request
  
    # PROFILE

    def profile_index
      user_profile = @user.profile
  
      render json: ProfileBlueprint.render(user_profile, view: :normal), status: :ok
    end

  def create
    profile = @current_user.profile.new(profile_params)

    if profile.save
      render json: ProfileBlueprint.render(profile, view: :normal), status: :created
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(profile_params)
      render json: ProfileBlueprint.render(@profile, view: :normal), status: :ok

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
    params.permit(:goals, :bio, :id)
  end
end
