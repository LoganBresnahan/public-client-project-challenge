# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.destroy_all
GamesCategory.destroy_all
Category.destroy_all

ids = (1..200).to_a
categories = []

# Seeding the games (and making an array of categories)
ids.each do |id|
  sleep 10
  begin
    bgg = BggApi.new
    if !(bgg.thing({id: id.to_s})["item"] == nil)
      p id
      # p bgg.thing({id: id.to_s})
      game = bgg.thing({id: id.to_s})["item"].first
      game_hash = {
        name: game["name"].first["value"],
        thumbnail_url: game["thumbnail"].first,
        min_players: game["minplayers"].first["value"].to_i,
        max_players: game["maxplayers"].first["value"].to_i,
        description: game["description"].first,
        year_published: game["yearpublished"].first["value"].to_i,
        playing_time: game["playingtime"].first["value"].to_i,
        min_age: game["maxplayers"].first["value"].to_i
      }

      saved_game = Game.create!(game_hash)

      category_objects = game["link"].select do |info_hash|
        info_hash["type"] == "boardgamecategory"
      end

      category_objects.each do |hash|
        category_hash = {
          name: hash["value"],
          bgg_id: hash["id"].to_i
        }
        category = Category.find_or_create_by!(category_hash)
        saved_game.categories << category
      end
    end
  rescue TypeError
    p "fuck off"
    next
  end
end

# [{"type"=>"boardgamecategory", "id"=>"1021", "value"=>"Economic"}, {"type"=>"boardgamecategory", "id"=>"1026", "value"=>"Negotiation"}, {"type"=>"boardgamecategory", "id"=>"1001", "value"=>"Political"}, {"type"=>"boardgamecategory", "id"=>"1002", "value"=>"Card Game"}, {"type"=>"boardgamecategory", "id"=>"1010", "value"=>"Fantasy"}, {"type"=>"boardgamecategory", "id"=>"1009", "value"=>"Abstract Strategy"}, {"type"=>"boardgamecategory", "id"=>"1035", "value"=>"Medieval"}]



# Parsing logic for game objects received from the API
# bgg = BggApi.new

# game = bgg.thing({:id => "1"})["item"].first

# id = game["id"].to_i
# name = game["name"].first["value"]
# thumbnail_url = game["thumbnail"].first
# description = game["description"].first # Note, this is kinda messy, we may need to remove some weird characters
# year_published = game["yearpublished"].first["value"].to_i
# min_players = game["minplayers"].first["value"].to_i
# max_players = game["maxplayers"].first["value"].to_i
# playing_time = game["playingtime"].first["value"].to_i
# min_play_time = game["minplaytime"].first["value"].to_i
# max_play_time = game["maxplaytime"].first["value"].to_i
# min_age = game["minage"].first["value"].to_i

# category_objects = game["link"].select do |info_hash|
#     info_hash["type"] == "boardgamecategory"
#     # Each item of the array here is a hash
# end

# game_mechanics_objects = game["link"].select do |info_hash|
#     info_hash["type"] == "boardgamemechanic"
#     # Each item of the array here is a hash
# end
