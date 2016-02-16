require 'rails_helper'

RSpec.describe UsersController do
  let!(:user) { User.create!(name: "Kendrick Lamar", email:"topimp@butterf.ly", password:"wesley") }

  describe "POST #create" do
    context  "when input is valid" do
      def valid_params
        { name: "Kendrick Lamar", email:"topimp@butterf.ly", password:"wesley" }
      end

      it "creates a new User" do
        expect {
          post :create, { user: valid_params }
        }.to change(User, :count).by(1)
      end

      it "redirects to user's profile" do
        post :create, { user: valid_params }
         expect(response).to redirect_to(user_path(user.id))
      end
    end

    context  "when input is invalid" do
      def invalid_params
        { name: "Kendrick Lamar", email: "", password: ""}
      end

      it "renders users/new" do
        post :create, { user: invalid_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    it "assigns the user to @user" do
      get :show, {id: user.id}
      expect(assigns(:user)).to eq(user)
    end
  end

end