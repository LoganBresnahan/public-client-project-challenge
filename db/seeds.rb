# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ids = (1..3).to_a

categories = []

bgg = BggApi.new

ids.each do |id|
  game = bgg.thing({id: id.to_s})["item"].first
  game_hash = {

    name:
  }
end
