require 'rails_helper'

RSpec.describe SessionsController do
  let!(:user) { User.create!(name: "Kendrick Lamar", email:"topimp@butterf.ly", password:"wesley") }

  describe "POST #create" do
    context  "when input is valid" do
      def valid_params
        { email: "topimp@butterf.ly", password: "wesley" }
      end

      xit "sets user's session" do
        post :create, { session: valid_params }

        expect(controller.current_user).to eq(user)
      end
      # how do you test for session validity

      it "redirects to homepage" do
        post :create, { session: valid_params }
        expect(response).to redirect_to(root_url)
      end
    end

    context  "when input is invalid" do
      def invalid_params
        { email: "topimp@butterf.ly", password: "goodkidmaadcity"}
      end

      it "re-renders login page" do
        post :create, { session: invalid_params }
        expect(response).to render_template(:new)
      end
    end
  end

end