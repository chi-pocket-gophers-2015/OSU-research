require 'rails_helper'

RSpec.describe ProposalsController, :type => :controller do

  let!(:user) { User.create!(email: 'jjoyce1@me.com', username: 'fac', password: 'password', faculty: false) }

  describe "GET #new" do
  	it "assigns a new proposal instance as @proposal" do
	  	session[:user_id] = 1
	  	get :new
	  	expect(assigns(:proposal)).to be_an_instance_of(Proposal)
  	end
  end

  describe "GET #create" do
  end


end
