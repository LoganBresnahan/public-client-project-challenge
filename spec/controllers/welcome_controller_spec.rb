require 'rails_helper'

RSpec.describe WelcomeController do

  describe "GET #index" do
    it "renders welcome index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

end