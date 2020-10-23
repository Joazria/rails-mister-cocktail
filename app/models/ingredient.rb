class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end
