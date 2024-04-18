class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy workouts_index foods_index waters_index profile_index]
  before_action :authenticate_request, only: %i[index show update destroy]

  def index
    users = User.all

    render json: users, status: 200
  end

  def show
    render json: UserBlueprint.render(@user, view: :normal), status: 200
  end

  def create
    user = User.create(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @current_user, status: :ok

    else
      render json: @current_user, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: nil, status: :ok
    else
      render json: @current_user, status: :unprocessable_entity
    end
  end

  # WORKOUTS

  def workouts_index
    user_workouts = @current_user.workouts

    render json: user_workouts, status: :ok
  end

  # FOODS

  def foods_index
    user_foods = @current_user.foods

    render json: user_foods, status: :ok
  end

  # WATERS

  def waters_index
    user_waters = @current_user.waters

    render json: user_waters, status: :ok
  end

  # PROFILE

  def profile_index
    user_profile = @current_user.profile

    render json: user_profile, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  def user_params
    params.require(:user).permit(:id, :email, :first_name, :password, :password_confirmation)
  end
end
   