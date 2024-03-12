class WatersController < ApplicationController
  def index
    waters = Water.all

    render json: waters, status: 200
  end

  def show
    user = User.find(params[:id])
    water = user.waters

    render json: water, status: 200
  end
end
