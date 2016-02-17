require 'rails_helper'

RSpec.describe Game, type: :model do
  let!(:catan) { Game.create!(name: "Settlers of Catan", min_players: 3, max_players: 6, thumbnail_url: "https://cf.geekdo-images.com/images/pic1338276_md.jpg", description: "Strategy sheep tiles roads block destroy friendships", year_published: 1872, playing_time: 60, min_age: 10) }

  it "has a name" do
    expect(catan.name).to eq "Settlers of Catan"
  end

  it "has a minimum number of players" do
    expect(catan.min_players).to eq 3
  end

  it "has a maximum number of players" do
    expect(catan.max_players).to eq 6
  end

  it "has a thumbnail image link" do
    expect(catan.thumbnail_url).to eq "https://cf.geekdo-images.com/images/pic1338276_md.jpg"
  end

  it "has a description" do
    expect(catan.description).to eq "Strategy sheep tiles roads block destroy friendships"
  end

  it "has a published year" do
    expect(catan.year_published).to eq 1872
  end

  it "has a playing time" do
    expect(catan.playing_time).to eq 60
  end

  it "has a minimum age" do
    expect(catan.min_age).to eq 10
  end

  describe Game do
    it { should have_many(:games_categories) }
    it { should have_many(:categories).through(:games_categories) }
    it { should have_many(:stashes) }
    it { should have_many(:users).through(:stashes) }
    it { should have_many(:comments) }
  end
end
