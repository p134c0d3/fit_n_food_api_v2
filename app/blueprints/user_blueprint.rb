# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id 

  view :normal do 
    fields :user_id, :email, :first_name, :updated_at
  end
end
