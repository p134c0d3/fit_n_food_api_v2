# frozen_string_literal: true

class ProfileBlueprint < Blueprinter::Base
  identifier :id 
  fields :bio, :goals, :updated_at, :created_at

  view :normal do 
    association :user, blueprint: UserBlueprint, view: :profile
  end

end
