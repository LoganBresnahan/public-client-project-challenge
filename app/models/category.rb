class Category < ActiveRecord::Base
  has_many :games_categories
  has_many :games, through: :games_categories
end
