require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'fac', password: 'password', faculty: true) }
  let!(:staff) { User.create!(email: 'jjoyce2@me.com', username: 'staff', password: 'password', faculty: false) }

  describe "GET #new" do
    it "redirects to home page if already logged in" do
      session[:user_id] = fac.id
      get :new
      expect(response).to redirect_to(user_path(fac))
      session[:user_id] = nil
    end

    it "assigns a new User instance as @user" do
      get :new
      expect(assigns(:user)).to be_an_instance_of(User)
    end

  end

  describe "POST #create" do
    context "when valid params are passed" do
      let(:good_params) {{username: 'fac', password: 'password'}}
      it "assigns current user to @user" do
        post :create, session: good_params
        expect(assigns(:user)).to eq(fac)
      end

      it "assigns user id to session" do
        post :create, session: good_params
        expect(session[:user_id]).to eq(assigns(:user).id)
      end

      it "redirects to users's homepage" do
        post :create, session: good_params
        expect(response).to redirect_to(user_path(assigns(:user)))
      end
    end

    context "when invalid params are passed" do
      let(:bad_params) {{username: 'fa', password: 'assword'}}
      it "assigns error messages to @errors" do
        post :create, session: bad_params
        expect(assigns(:errors)).to be_an_instance_of(Array)
      end
      it "re-renders the 'new' template" do
        post :create, session: bad_params
        expect(response).to render_template 'new'
      end

    end
  end

end
