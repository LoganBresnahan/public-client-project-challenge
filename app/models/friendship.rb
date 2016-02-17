class Friendship < ActiveRecord::Base
  belongs_to :friend, class_name: "User"
  belongs_to :user
  has_many :groups

  validates :friend, uniqueness: {scope: :user, message: "cannot friend same person twice"}
end
