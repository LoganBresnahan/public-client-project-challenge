class Game < ActiveRecord::Base
  has_many :games_categories
  has_many :categories, through: :games_categories
end
