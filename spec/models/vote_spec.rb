require 'rails_helper'

RSpec.describe Vote, type: :model do
	let(:vote) { Vote.create!(user_id: 1, game_id: 1, value: 1) }

  it "has a value" do
  	expect(vote.value).to eq 1
  end

  it "has a user id" do
  	expect(vote.user_id).to eq 1
  end

  it "has a game id" do
  	expect(vote.game_id).to eq 1
  end

  describe Vote do
  	subject { Vote.new(user_id: 1000, game_id: 1000) }
  	it { should belong_to(:user) }
  	it { should belong_to(:game) }
  	it { should validate_uniqueness_of(:user_id).scoped_to(:game_id).with_message('has already voted on this game') }
  	it { should validate_inclusion_of(:value).in_array([1, -1]) }
  end
end
