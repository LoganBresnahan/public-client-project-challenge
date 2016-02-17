class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :user, uniqueness: { scope: :game, message: "has already voted on this game" }
  validates :value, inclusion: { in: [1, -1] }
end
