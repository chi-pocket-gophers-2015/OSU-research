require 'rails_helper'

RSpec.describe ExperimentsController, :type => :controller do
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'fac', password: 'password', faculty: true) }
  let!(:staff) { User.create!(email: 'jjoyce2@me.com', username: 'jjoyce2', password: 'password', faculty: false) }
  let!(:category) { Category.create!(name: "Risk Perception") }
  let!(:proposal) { Proposal.create!(title: Faker::Lorem.sentence, hypothesis: Faker::Lorem.paragraph, active: true, summary: Faker::Lorem.paragraph, faculty_id: 1, category_id: 1) }

  describe "GET #new" do
    
    it "assigns the current proposal as @proposal" do
      session[:user_id] = staff.id
      get :new, {proposal_id: proposal.id}
      expect(assigns(:proposal)).to eq(proposal)
    end
    it "assigns a new experiment instance as @experiment" do
      session[:user_id] = staff.id
      get :new
      expect(assigns(:experiment)).to be_an_instance_of(Experiment)
    end
    it "re-reroutes to the homepage if user isn't a staffer" do
      session[:user_id] = fac.id
      get :new
      expect(response).to redirect_to(user_path(fac))
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "saves new experiment as @experiment"
      it "re-directs to the experiment page"

    end

    context "when invalid params are passed" do
      it "assigns errors to @errors"
      it "re-renders new experiment page"
    end

  end

  describe "GET #edit" do
    it "re-directs to experiment page if experiment doesn't belong to user"
    it "assigns experiment to @experiment"
    it "renders 'edit' page"

  end

  describe "PUT #update" do
    context "when valid params are passed" do
      it "updates @experiment with new params"
      it "re-directs to the experiment page"

    end

    context "when invalid params are passed" do
      it "assigns errors to @errors"
      it "re-renders edit experiment page"
    end

  end

end
