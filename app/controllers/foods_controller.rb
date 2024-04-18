class  FoodsController < ApplicationController
  before_action :set_food, only: %i[update destroy show]
  before_action :authenticate_request
  
  def foods_index
    foods = Food.all

    render json: FoodsBlueprint.render(foods, view: :normal), status: :ok
  end

  def create
    food = @current_user.foods.new(food_params)

    if food.save
      render json: FoodsBlueprint.render(food, view: :normal), status: :created
    else
      render json: food.errors, status: :unprocessable_entity
    end
  end

  def update
    if @food.update(food_params)
      render json: FoodsBlueprint.render(food, view: :normal), status: :ok

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
    params.permit(:food_name, :calories, :id)
  end
end
