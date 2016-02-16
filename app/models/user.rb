class User < ActiveRecord::Base
  has_many :stashes
  has_many :games, through: :stashes
<<<<<<< HEAD
  has_many :comments, foreign_key: :commenter_id
=======
  has_many :friendships
  has_many :groups, foreign_key: :creator_id
  has_many :friends, through: :friendships, source: :friend
>>>>>>> 35ce4e24160117e61d4001042f2b5ddf9025e433

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def does_not_suck?
    return true
  end

end
