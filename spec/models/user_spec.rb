require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    create(:user).should be_valid
  end

  describe "Model validations" do
    it "is invalid without a username" do
      build(:user, username: nil).should_not be_valid
    end

    it "is invalid without an email" do
      build(:user, email: nil).should_not be_valid
    end

    # it "is invalid without a password" do
    #   expect(build(:user)).to validate_presence_of(:password)
    # end

    # it "is invalid if a faculty boolean is not true or false" do
    #   user = build(:user)
    #   expect(user).to ensure_inclusion_of(:faculty).in_array([true, false])
    # end
  end

  describe "ActiveRecord associations" do
    it "has many experiments" do
      expect(build(:user)).to have_many(:experiments)
    end

    it "has many observations" do
      expect(build(:user)).to have_many(:observations)
    end

    it "has many proposals" do
      expect(build(:user)).to have_many(:proposals)
    end

    it "has many comments" do
      expect(build(:user)).to have_many(:comments)
    end
  end

  describe "instance methods" do
    it "responds to its methods" do
      expect(build(:user)).to respond_to(:determine_faculty)
      expect(build(:user)).to respond_to(:secret_code=)
    end

    it "allows faculty to set their secret code" do
      expect(build(:user).secret_code=("faculty")).to eq("faculty")
    end

    it "allows staff to set their secret code" do
      expect(build(:user).secret_code=("staff")).to eq("staff")
    end

    it "correctly determines whether or not a user is faculty" do
      user = build(:user)
      user.secret_code=("faculty")
      expect(user.faculty).to eq(true)
    end

    it "correctly determines whether or not a user is staff" do
      user = build(:user)
      user.secret_code=("staff")
      expect(user.faculty).to eq(false)
    end
  end


end
