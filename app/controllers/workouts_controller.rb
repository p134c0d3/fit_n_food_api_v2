class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[update destroy show]
  before_action :authenticate_request
  
  def workouts_index
    workouts = Workout.all

    render json: WorkoutsBlueprint.render(workouts, view: :normal), status: 200
  end

  def create
    workout = @current_user.workouts.new(workout_params)

    if workout.save
      render json: WorkoutsBlueprint.render(workout, view: :normal), status: :created
    else
      render json: workout.errors, status: :unprocessable_entity
    end
  end

  def update
    if @workout.update(workout_params)
      render json: WorkoutsBlueprint.render(@workout, view: :normal), status: :ok

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
    params.permit(:workout_name, :sets, :reps, :calories_burned, :id)
  end
end
