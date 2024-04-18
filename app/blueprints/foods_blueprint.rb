# frozen_string_literal: true

class FoodsBlueprint < Blueprinter::Base
  identifier :id 
  fields :user_id, :food_name, :calories, :created_at

  view :normal do 
    association :user, blueprint: UserBlueprint, view: :foods
  end
end
