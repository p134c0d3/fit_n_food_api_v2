class ProfileController < ApplicationController
  before_action :set_profile, only: %i[update destroy]
  before_action :authenticate_request
  
  def create
    profile = @current_user.profile.new(profile_params)

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

  def profile_index
    # debugger
    user_profile = @current_user.profile

    render json: user_profile, status: :ok
  end

  def show
    render json: @current_user.profile, status: :ok
  end


  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.permit(:bio, :goals, :id)
  end
end
