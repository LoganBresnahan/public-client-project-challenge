require 'rails_helper'

describe Grouping do
	it { should belong_to(:friendship) }
	it { should belong_to(:group) }
end