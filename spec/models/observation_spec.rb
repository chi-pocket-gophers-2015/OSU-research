require 'rails_helper'

RSpec.describe Observation, :type => :model do
  it "has a valid factory" do
    create(:observation).should be_valid
  end

  describe "ActiveRecord associations" do
    it "belongs to an experiment" do
      expect(build(:observation)).to belong_to(:experiment)
    end

    it "has one staffer" do
      expect(build(:observation)).to have_one(:staffer)
    end
  end


end
