require 'rails_helper'

RSpec.describe CategoriesController do

    describe "GET #index" do
    let!(:categories) { Category.create!([{name: "Suspense"}, {name: "Noir"}]) }
      it "assigns all categories to an instance variable" do
        get :index
        expect(assigns(:categories).first).to be_a(Category)
      end

      it "renders category index page" do
        get :index
        expect(response).to render_template(:index)
      end
    end


    describe "GET #show" do
      let!(:jumbotron) { Category.create!(name: "Jumbotron") }

      it "assigns category to an instance variable" do
        get :show, { id: jumbotron.id }
        expect(assigns(:category)).to be_a(Category)
      end

      it "renders category index page" do
        get :show, { id: jumbotron.id }
        expect(response).to render_template(:show)
      end
    end

end