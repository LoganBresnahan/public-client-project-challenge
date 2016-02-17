require "spec_helper"

describe CurrentUserHelper do
  before(:each) do
    session[:user_id] = current.id
  end

  describe "#current_user" do
    let!(:current) {User.create!(name: "booboo", email: "baker@matt.com", password: "password")}

    it "returns current user" do
      expect(current_user).to eq(current)
    end
  end

  describe "#has_game?" do
    let!(:current) { User.create!(name: "booboo", email: "baker@matt.com", password: "password") }
    let!(:dominos) { Game.create!(name: "Dominos", description: "Not pizza") }
    let!(:checkers) { Game.create!(name: "Checkers", description: "Not tablecloth") }

    it "returns true for a game the user has" do
      current.games << dominos
      expect(has_game?(dominos)).to eq true
    end

    it "returns false for a game the user doesn't have" do
      expect(has_game?(checkers)).to eq false
    end
  end


end