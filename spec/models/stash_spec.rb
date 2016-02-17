require 'rails_helper'

describe Stash do
	subject { Stash.new(user_id: 100, game_id: 1) }
	it { should belong_to(:user) }
	it { should belong_to(:game) }
	# it { should validate_uniqueness_of(:game).scoped_to(:user).with_message('cannot be added twice to your games') }
end