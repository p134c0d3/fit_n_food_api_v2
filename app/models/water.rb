class Water < ApplicationRecord
  belongs_to :user

  validates :ounces, presence: true
end
