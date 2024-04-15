class  FoodsController < ApplicationController
  before_action :set_food, only: %i[update destroy show]
  
  def create
    food = Food.new(food_params)

    if food.save
      render json: food, status: :created
    else
      render json: food.errors, status: :unprocessable_entity
    end
  end

  def update
    if @food.update(food_params)
      render json: @food, status: :ok

    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @food.destroy
      render json: nil, status: :ok
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.permit(:food_name, :calories, :user_id, :id)
  end
end
