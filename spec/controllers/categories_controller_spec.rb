require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do


end


# describe GamesController do
#   let!(:game) { Game.create!(user_throw: Game::THROWS.sample) }

#   describe "GET #index" do
#     it "assigns all games as @games"
#   end

#   describe "GET #show" do
#     it "assigns the requested game as @game" do
#       get :show, { id: game.to_param }
#       expect(assigns(:game)).to eq(game)
#     end

#     it "assigns winner throw"

#     it "assigns loser throw"
#   end

#   describe "GET #new" do
#     pending
#   end

#   describe "POST create" do
#     context "when valid params are passed" do
#       it "creates a new Game"

#       it "assigns a newly created game as @game"

#       it "redirects to the created game"
#     end

#     context "when invalid params are passed" do
#       it "assigns a newly created but unsaved game as @game"

#       it "re-renders the 'new' template"
#     end
#   end

#   describe "DELETE #destroy" do
#     it "assigns the requested game as @game" do
#       delete :destroy, { id: game.to_param }
#       expect(assigns(:game)).to eq(game)
#     end

#     it "destroys the requested game" do
#       expect {
#         delete :destroy, id: game.id
#       }.to change(Game, :count).by(-1)
#     end

#     it "redirects to the games list"
#   end

# end