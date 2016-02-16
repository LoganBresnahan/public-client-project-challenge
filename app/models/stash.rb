dd class Stash < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  validates :game, uniqueness: { scope: :user, message: "cannot be added twice to your games" }
end
