require 'rails_helper'

RSpec.feature "Proposals", :type => :feature do
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'staff', password: 'password', faculty: true) }
  let!(:rp) { Category.create!(name: "Risk Perception") }
  let!(:prop) { Proposal.create!(title: Faker::Lorem.sentence, hypothesis: Faker::Lorem.paragraph, active: true, summary: Faker::Lorem.paragraph, faculty_id: fac.id, category_id: rp.id) }

  scenario "click on proposal link" do
    allow(User).to receive(:find_by_id).and_return(fac)
    visit '/categories/1'
    click_link(prop.title)
    expect(current_path).to eq(proposal_path(prop))
    expect(page).to have_content("Proposal:")
  end

  scenario "click new proposal link" do
    allow(User).to receive(:find_by_id).and_return(fac)
    visit user_path(fac)
    click_link("New Proposal")
    expect(current_path).to eq(new_proposal_path)
  end


  scenario "create new proposal" do
    allow(User).to receive(:find_by_id).and_return(fac)
    visit new_proposal_path
    fill_in('Title', with: 'New Prop')
    fill_in('Hypothesis', with: 'I think things are cool')
    fill_in('Summary', with: "You see, it's like this...")
    click_button('Create Proposal')
    expect(current_path).to eq(user_path(fac))
  end

end
