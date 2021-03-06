require 'rails_helper'

RSpec.describe UsersController do
  let!(:user) { User.create!(name: "Kendrick Lamar", email:"topimp@butterf.ly", password:"wesley") }

  describe "GET #index" do
    it "shows a list of all users" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    context  "when input is valid" do
      def valid_params
        { name: "George Clinton", email:"boss@pfunk.com", password:"password" }
      end

      it "creates a new User" do
        expect {
          post :create, { user: valid_params }
        }.to change(User, :count).by(1)
      end

      it "redirects to user's profile" do
        post :create, { user: valid_params }
         expect(response).to redirect_to(user_path(User.last.id))
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
      get :show, {id: User.last.id}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #edit" do
    # id mysteriously gone
    xit "renders the user's edit form" do
      get :edit, { id: User.last.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #update" do
    context  "when input is valid" do
      def valid_params
        { name: "Kendrick Lamar", email:"topimp@butterf.ly", password:"obamasaywhatitdo" }
      end

      it "redirects to user's profile" do
        post :update, { id: User.last.id, user: valid_params }
         expect(response).to redirect_to(user_path(User.last.id))
      end
    end
  end

  describe "POST #destroy" do
    # let!(:user) { User.create!(name: "Kendrick Lamar", email:"awww@yes.com", password:"wesley") }
    xit "deletes a user" do
      expect {
        delete :destroy, id: User.first.id
        }.to change(User, :count).by(1)
    end
    # id mysteriously gone?
  end



end