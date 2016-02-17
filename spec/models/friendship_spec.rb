require 'rails_helper'

RSpec.describe Friendship, type: :model do
	let!(:friendship) { Friendship.create!(friend_id: 1) }

	it "has a friend id" do
		expect(friendship.friend_id).to eq 1
	end

	describe Friendship do
		it { should belong_to(:friend).class_name('User') }
		# it { should have_many(:groups) }
		it { should belong_to(:user) }
	end

end