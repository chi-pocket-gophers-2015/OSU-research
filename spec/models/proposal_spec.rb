require 'rails_helper'

RSpec.describe Proposal, :type => :model do
  it "has a valid factory" do
    create(:proposal).should be_valid
  end

  it "is invalid without a title" do
    build(:proposal, title: nil).should_not be_valid
  end

  it "is invalid without a hypothesis" do
    build(:proposal, hypothesis: nil).should_not be_valid
  end

  it "is invalid without an active status" do
    build(:proposal, active: nil).should_not be_valid
  end

  it "is invalid without a summary" do
    build(:proposal, summary: nil).should_not be_valid
  end


end
