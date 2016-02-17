class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :user_id, uniqueness: { scope: :game_id, message: "has already voted on this game" }
  validates :value, inclusion: { in: [1, -1] }
end
