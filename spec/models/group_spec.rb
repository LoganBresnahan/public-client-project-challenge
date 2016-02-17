require 'rails_helper'

RSpec.describe Group, type: :model do
	let!(:group) { Group.create!(creator_id: 1, name: "work friends") }

	it "has a creator id" do
		expect(group.creator_id).to eq 1
	end

	it "has a name" do
		expect(group.name).to eq "work friends"
	end

	describe Group do
		it { should belong_to(:creator) }
		it { should have_many(:groupings) }
		# it { should have_many(:friendships).through(:groupings) }
		it { should have_many(:friends).through(:friendships) }
	end

end