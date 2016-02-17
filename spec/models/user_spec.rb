require 'rails_helper'

RSpec.describe User, :type => :model do

  let!(:david) { User.create!(name: "David", email: "dma315@gmail.com", password: "password") }

  it "has a name" do
    expect(david.name).to eq "David"
  end

  it "has an email" do
    expect(david.email).to eq "dma315@gmail.com"
  end

  it "has a password that is not null" do
    expect(david.password).to_not be_nil
  end

  it "does not suck" do
    expect(david.does_not_suck?).to be true
  end

  describe User do
    it { should have_many(:stashes) }
    it { should have_many(:games).through(:stashes) }
    it { should have_many(:friendships) }
    it { should have_many(:groups).with_foreign_key(:creator_id) }
    it { should have_many(:friends).through(:friendships).source(:friend) }
    it { should have_many(:comments).with_foreign_key(:commenter_id) }
    it { should have_secure_password }
    it { should validate_uniqueness_of(:email) }
  end

end
