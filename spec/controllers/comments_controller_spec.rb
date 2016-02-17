require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:test_comments) { Comment.create!([{content: "Cats"}, {content: "Dogs"}]) }

  def comment_params
    user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "password")
    game = Game.create!(name: Faker::Hipster.word, description: Faker::Hipster.sentence)

    return { content: Faker::Hipster.word, game_id: game.id, commenter_id: user.id }
  end
  let(:comment) { Comment.create!(comment_params) }

  describe "GET comments#index" do
    # how to test get controller of nested route?
    xit "assigns @comments" do
      get :index, :game_id => comment.game_id
      expect(assigns(:comments).to eq([comment]))
      # expect(assigns(:test_comments).first).to be_a(Comment)
    end

    xit "renders comment index partial" do
      get :index
      expect(response).to render_template(:'comments/_index')
    end
  end

  describe "POST #create" do
    # how to test post controller of nested route?

    xit "creates a new comment" do
      expect {
        post :create, { comment: comment_params }
      }.to change(Comment, :count).by(1)
    end

    xit "redirects to game's page" do
      post :create, { comment: comment_params }
       expect(response).to redirect_to(game_path(comment.game.id))
    end
  end

  describe "POST #destroy" do
    xit "deletes a comment" do
      expect {
        delete :destroy, { id: comment.id }
      }.to change(Comment, :count).by(-1)
    end

    xit "redirects to game's page" do
      delete :destroy, { id: comment.id }
      expect(response).to redirect_to(game_path(comment.game.id))
    end
  end

end