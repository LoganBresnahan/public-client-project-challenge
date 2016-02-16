class Group < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :groupings
  has_many :friendships, through: :groupings
  has_many :friends, through: :friendships
end
