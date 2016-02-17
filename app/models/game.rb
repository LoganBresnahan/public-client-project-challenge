class Game < ActiveRecord::Base
  has_many :games_categories
  has_many :categories, through: :games_categories
  has_many :stashes
  has_many :users, through: :stashes
  has_many :comments
  has_many :votes
  has_many :user_votes, through: :votes, source: :user

  def vote_score
    self.votes.map(&:value).reduce(:+) || 0
  end
end
