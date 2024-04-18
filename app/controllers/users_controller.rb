class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy workouts_index foods_index waters_index profile_index]
  before_action :authenticate_request, only: %i[index show update destroy]

  def index
    users = User.all

    render json: @current_user, status: 200
  end

  def show
    render json: UserBlueprint.render(@current_user, view: :normal), status: 200
  end

  def create
    @user = User.create(user_params)

    if user.save
      render json: @user, status: :created
    else
      render json: @user, status: :unprocessable_entity
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


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:id, :email, :first_name, :password, :password_confirmation)
  end
end
   