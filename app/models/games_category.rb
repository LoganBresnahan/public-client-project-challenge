class GamesCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :game
end
