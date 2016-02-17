require 'rails_helper'

RSpec.describe Comment, type: :model do
	let(:nice_words) { Comment.create!(content: "Whoa. This game is awesome!", commenter_id: 31, game_id: 1) }

	it "has content" do
		expect(nice_words.content).to eq "Whoa. This game is awesome!"
	end

	it "has a commenter id" do
		expect(nice_words.commenter_id).to eq 31
	end

	it "has a game id" do
		expect(nice_words.game_id).to eq 1
	end

	describe Comment do
		it { should belong_to(:commenter).class_name('User') }
		it { should belong_to(:game) }
	end


end