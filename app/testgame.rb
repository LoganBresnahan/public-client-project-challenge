bgg = BggApi.new

game = bgg.thing({:id => "1"})["item"].first

id = game["id"].to_i
thumbnail_url = game["thumbnail"][0]
name = game["name"].first["value"]
description = game["description"].first # Note, this is kinda messy, we may need to remove some weird characters
year_published = game["yearpublished"].first["value"].to_i
min_players = game["minplayers"].first["value"].to_i
max_players = game["maxplayers"].first["value"].to_i
playing_time = game["playingtime"].first["value"].to_i
min_play_time = game["minplaytime"].first["value"].to_i
max_play_time = game["maxplaytime"].first["value"].to_i
min_age = game["minage"].first["value"].to_i

category_objects = game2["link"].select do |info_hash|
    info_hash["type"] == "boardgamecategory"
    # Each item of the array here is a hash
end

game_mechanics_objects = game["link"].select do |info_hash|
    info_hash["type"] == "boardgamemechanic"
    # Each item of the array here is a hash
end


