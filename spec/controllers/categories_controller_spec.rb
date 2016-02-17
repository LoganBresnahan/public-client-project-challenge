require 'rails_helper'

RSpec.describe CategoriesController do
  let!(:categories) { Category.create!([{name: "Suspense"}, {name: "Noir"}]) }

  let!(:jumbotron) { Category.create!(name: "Jumbotron") }

  describe "GET #index" do
    it "assigns all categories to an instance variable" do
      get :index
      expect(assigns(:categories)).to eq(categories)
    end

    it "renders category index page" do
      get :index
      expect(response).to render_template(:index)
    end

    describe "GET #show" do
    it "assigns category to an instance variable" do
      get :index
      expect(assigns(:category)).to eq(jumbotron)
    end

    it "renders category index page" do
      get :show
      expect(response).to render_template(:show)
    end
  end

end