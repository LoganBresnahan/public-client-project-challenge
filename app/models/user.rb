class User < ActiveRecord::Base
  has_many :collections
  has_many :games, through: :collections

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def does_not_suck?
    return true
  end

end
