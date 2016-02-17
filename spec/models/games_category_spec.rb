require 'rails_helper'

RSpec.describe GamesCategory, type: :model do
	let(:game_cat) { GamesCategory.create!(game_id: 1, category_id: 1) }

	it "has a game id" do
		expect(game_cat.game_id).to eq 1
	end

	it "has a category id" do
		expect(game_cat.category_id).to eq 1
	end

	describe GamesCategory do
		it { should belong_to(:category) }
		it { should belong_to(:game) }
	end
end