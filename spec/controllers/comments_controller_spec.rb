require 'rails_helper'

RSpec.describe CommentsController do
  let!(:test_comments) { Comment.create!([{content: "Cats"}, {content: "Dogs"}, {content: "Jumbotrons"}]) }

  describe "GET #index" do
    it "assigns all games to an instance variable" do
      get :index
      expect(assigns(:comments)).to eq(test_comments)
    end

    it "renders comment index page" do
      get :index
      expect(response).to render_template(:index)
    end

    describe "POST #create" do
      it "creates a new comment" do
        expect {
          post :create, { comment: test_comments[0] }
        }.to change(Comment, :count).by(1)
      end

      it "redirects to game's page" do
        post :create, { comment: test_comments[0] }
         expect(response).to redirect_to(game_path(game.id))
      end
    end

    describe "POST #destroy" do
      it "deletes a comment" do
        expect {
          post :destroy, { comment: test_comments[0] }
        }.to change(Comment, :count).by(1)
      end

      it "redirects to game's page" do
        post :create, { comment: test_comments[0] }
         expect(response).to redirect_to(game_path(game.id))
      end
    end

end