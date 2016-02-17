class Game < ActiveRecord::Base
  has_many :games_categories
  has_many :categories, through: :games_categories
  has_many :stashes
  has_many :users, through: :stashes
  has_many :comments
end
