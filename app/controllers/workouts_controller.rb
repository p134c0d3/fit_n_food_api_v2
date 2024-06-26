class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[update destroy]
  before_action :authenticate_request
  
  def create
    workout = @current_user.workouts.new(workout_params)

    if workout.save!
      render json: workout, status: :created
    else
      render json: workout.errors, status: :unprocessable_entity
    end
  end

  def update
    if @workout.update(workout_params)
      render json: @workout, status: :ok

    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @workout.destroy
      render json: nil, status: :ok
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  def workouts_index
    user_workouts = @current_user.workouts

    render json: user_workouts, status: :ok
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.permit(:workout_name, :sets, :reps, :calories_burned, :id)
  end
end
