class Water < ApplicationRecord

  # validations
  validates :ounces, presence: true
  
  # associations
  belongs_to :user
end
