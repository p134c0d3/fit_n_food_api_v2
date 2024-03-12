class FoodsController < ApplicationController
  def index
    foods = Food.all

    render json: foods, status: 200
  end

  def show
    user = User.find(params[:id])
    food = user.foods

    render json: food, status: 200
  end
end
