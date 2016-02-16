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

end
