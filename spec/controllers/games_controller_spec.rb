require 'rails_helper'

RSpec.describe GamesController do
  let!(:games) { Game.create!([{name: "Cats", description:"Lots of cats"},{name: "Dogs", description: "More dogs"}, {name: "Jumbotrons", description: "MORE JUMBOTRON"}]) }

  let!(:catan) { Game.create!(name: "Catan", description: "Classic strategy game") }

  describe "GET #index" do
    it "assigns all games to an instance variable" do
      get :index
      expect(assigns(:games).first).to be_a(Game)
    end

    it "renders game index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns game to an instance variable" do
      get :show, { id: catan.id }
      expect(assigns(:game)).to eq(catan)
    end

    it "renders game index page" do
      get :show, { id: catan.id }
      expect(response).to render_template(:show)
    end
  end

end