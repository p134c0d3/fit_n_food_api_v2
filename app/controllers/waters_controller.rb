class WatersController < ApplicationController
  before_action :set_water, only: %i[update destroy]
  before_action :authenticate_request
  
  def create
    water = @current_user.waters.new(water_params)

    if water.save
      render json: water, status: :created
    else
      render json: water.errors, status: :unprocessable_entity
    end
  end

  def update
    if @water.update(water_params)
      render json: @water, status: :ok

    else
      render json: @water.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @water.destroy
      render json: nil, status: :ok
    else
      render json: @water.errors, status: :unprocessable_entity
    end
  end

  def waters_index
    user_waters = @current_user.waters

    render json: user_waters, status: :ok
  end

  private

  def set_water
    @water = Water.find(params[:id])
  end

  def water_params
    params.permit(:ounces, :id)
  end
end
