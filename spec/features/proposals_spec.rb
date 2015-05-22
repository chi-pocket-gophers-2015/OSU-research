require 'rails_helper'

RSpec.feature "Proposals", :type => :feature do
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'staff', password: 'password', faculty: true) }

  scenario "click on proposal link" do
    allow(User).to receive(:find_by_id).and_return(fac)
    visit '/categories/1'
    click_link(proposal_path(Proposal.first))
    expect(current_path).to eq(proposal_path(Proposal.first))
  end

  scenario "click new proposal link"
  # allow(User).to receive(:find_by_id).and_return(fac)

  scenario "create new proposal"
  # allow(User).to receive(:find_by_id).and_return(fac)

end
