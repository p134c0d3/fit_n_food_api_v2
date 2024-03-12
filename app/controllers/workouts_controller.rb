class WorkoutsController < ApplicationController
  def index
    workouts = Workout.all

    render json: workouts, status: 200
  end

  def show 
    user = User.find(params[:id])
    workout = user.workouts

    render json: workout, status: 200
  end
end
