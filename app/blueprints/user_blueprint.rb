# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id 

  view :normal do 
    fields :email, :first_name, :updated_at
  end
end
