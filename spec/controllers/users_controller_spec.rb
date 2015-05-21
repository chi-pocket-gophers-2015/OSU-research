require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'fac', password: 'password', faculty: true) }
  let!(:staff) { User.create!(email: 'jjoyce2@me.com', username: 'staff', password: 'password', faculty: false) }

  describe "GET #show" do
    it "assigns current user as @user" do
      get :show, {id: fac.id}
      expect(assigns(:user)).to eq(fac)
    end

    it "assigns @user's proposals as @proposals" do
      get :show, {id: fac.id}
      expect(assigns(:proposals)).to eq(fac.proposals.order('created_at desc'))
    end

    it "renders faculty homepage if user is faculty" do
      get :show, {id: fac.id}
      expect(response).to render_template('faculty_homepage')
    end

    it "renders staffer homepage if user is staffer" do
      get :show, {id: staff.id}
      expect(response).to render_template('staffers_homepage')
    end
  end

  describe "GET #new" do
    it "assigns a new user instance as @user" do
      get :new
      expect(assigns(:user)).to be_an_instance_of(User)
    end

    it "renders sign-up page" do
      # expect(current_path).to eq(new_user_path)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new User"

      it "assigns a newly created user as @user"

      it "redirects to the user's homepage"

    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved user as @user"

      it "re-renders the 'new' template"

    end

  end

end
