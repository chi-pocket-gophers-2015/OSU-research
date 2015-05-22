require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  let!(:first) { Category.create(name: 'science') }
  let!(:categories) {Category.all}
  let!(:prop) {first.proposals.create(title: 'hey',
    hypothesis: 'guys', active: true, summary: 'things')}

  describe "GET #index" do
    it "assigns all categories as @categories" do
      get :index
      expect(assigns(:categories)).to eq(categories)
    end
  end

  describe "GET #show" do
    it "assigns the requested category as @category" do
      get :show, {id: first.id}
      expect(assigns(:category)).to eq(first)
    end

    it "assigns all proposals for the category as @proposals" do
      get :show, {id: first.id}
      expect(assigns(:proposals)).to eq([prop])
    end

  end


end

