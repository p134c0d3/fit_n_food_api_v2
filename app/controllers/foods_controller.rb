class  FoodsController < ApplicationController
  before_action :set_food, only: %i[update destroy]
  before_action :authenticate_request
  
  def create
    # debugger
    food = @current_user.foods.new(food_params)
    if food.save!
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

  def user_foods
    user_foods = @current_user.foods

    render json: user_foods, status: :ok
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:food_name, :calories, :id)
  end
end
