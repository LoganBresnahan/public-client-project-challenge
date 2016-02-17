require 'rails_helper'
# require 'spec_helper'

RSpec.describe Category, type: :model do
  # let!(:arkham) { Game.create!(name: "Arkham Horror", description: "spooky") }
  # let!(:mystery) { Category.create!(name: "Mystery", bgg_id: 14) }
  # let!(:categorization) { GamesCategory.create!(game_id: arkham.id, category_id: 14) }
  before(:each) do
    @game = Game.create!(name: "Arkham Horror", description: "spooky")
    @category = Category.create!(name: "Mystery", bgg_id: 14)
    @link = GamesCategory.create!(game_id: @game.id, category_id: @category.bgg_id)
  end

  it "has a name" do
    expect(@category.name).to eq "Mystery"
  end

  xit "has an associated game" do
    expect(@category.games).to eq @game
  end
end
