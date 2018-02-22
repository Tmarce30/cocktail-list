class Cocktail < ApplicationRecord
  has_many :doses

  validates :name, uniqueness: true, presence: true
  # validates :description, presence: true
  # validates :recipe, presence: true
end
