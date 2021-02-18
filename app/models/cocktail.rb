class Cocktail < ApplicationRecord
  has_many :ingredient
  has_many :doses

end
