# frozen_string_literal: true

class WatersBlueprint < Blueprinter::Base
  identifier :id 
  fields :user_id, :ounces, :created_at

  view :normal do 
    association :user, blueprint: UserBlueprint, view: :waters
  end
end
