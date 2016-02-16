class User < ActiveRecord::Base
  has_many :stashes
  has_many :games, through: :stashes
  has_many :friendships
  has_many :groups, foreign_key: :creator_id
  has_many :friends, through: :friendships, source: :friend
  has_many :comments, foreign_key: :commenter_id

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def does_not_suck?
    return true
  end

end
