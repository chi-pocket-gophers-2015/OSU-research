require 'rails_helper'

RSpec.describe ExperimentsController, :type => :controller do

  User.create!(email: 'jjoyce2@me.com', username: 'jjoyce2', password: 'password', faculty: false)
  Category.create!(name: "Risk Perception")
  Proposal.create!(title: Faker::Lorem.sentence, hypothesis: Faker::Lorem.paragraph, active: true, summary: Faker::Lorem.paragraph, faculty_id: 1, category_id: 1)

  describe "GET #new" do
    it "assigns the current user to @user"
    it "assigns the current proposal as @proposal"
    it "assigns a new experiment instance as @experiment"
    it "re-reoutes to the homepage if user isn't a staffer"
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
