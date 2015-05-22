require 'rails_helper'

RSpec.describe ProposalsController, :type => :controller do

  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'fac', password: 'password', faculty: true) }
  let!(:staff) { User.create!(email: 'jjoyce2@me.com', username: 'staff', password: 'password', faculty: false) }

  describe "GET #new" do
  	it "assigns a new proposal instance as @proposal" do
	  	session[:user_id] = fac.id
	  	get :new
	  	expect(assigns(:proposal)).to be_an_instance_of(Proposal)
  	end

    it "re-directs to home page if user is not faculty" do
      session[:user_id] = staff.id
      get :new
      expect(response).to redirect_to(user_path(staff))
    end
  end

  describe "POST #create" do
  	context "when valid params are passed" do
  		let(:good_params) {{title: "Awesome Proposal", hypothesis: "It's awesome", status: true, summary: "All good"}}
  		it "creates a new Proposal" do
  			session[:user_id] = 1
  			expect { post :create, proposal: good_params}.to change(Proposal, :count).by(1)
  		end
  	end

  	context "when invalid params are passed" do
			let(:bad_params) {{title: nil, hypothesis: nil, status: nil}}
  		it "re-renders the 'new' template" do
  			session[:user_id] = 1
  			post :create, proposal: bad_params
  			expect(response).to render_template(:new)
  		end
  	end
  end


end
