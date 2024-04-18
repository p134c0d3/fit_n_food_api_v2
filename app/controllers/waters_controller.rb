class WatersController < ApplicationController
  before_action :set_water, only: %i[update destroy show]
  before_action :authenticate_request
  
  def waters_index
    waters = Water.all

    render json: WatersBlueprint.render(waters, view: :normal), status: :ok
  end

  def create
    water = @current_user.waters.new(water_params)

    if water.save
      render json: WatersBlueprint.render(water, view: :normal), status: :created
    else
      render json: water.errors, status: :unprocessable_entity
    end
  end

  def update
    if @water.update(water_params)
      render json: WatersBlueprint.render(@water, view: :normal), status: :ok

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

  private

  def set_water
    @water = Water.find(params[:id])
  end

  def water_params
    params.permit(:ounces, :id)
  end
end
