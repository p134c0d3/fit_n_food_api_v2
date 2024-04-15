class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[update destroy show]
  
  def create
    workout = Workout.new(workout_params)

    if workout.save
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

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.permit(:workout_name, :sets, :reps, :calories_burned, :user_id, :id)
  end
end
