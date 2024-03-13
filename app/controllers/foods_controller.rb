class FoodsController < ApplicationController
  def foods_index
    foods = Food.all

    render json: foods, status: 200
  end

  def show
    user = User.find(params[:id])
    food = user.foods

    render json: food, status: 200
  end

  def create 
    food = @user.foods.new(food_params)

    if food.save
      render json: food, status: :created
    else
      render json: food.errors, status: :unprocessable_entity
    end
  end

  private 

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  def food_params
    params.require(:food).permit(:food_name, :calories)
  end
end
