require 'rails_helper'

RSpec.feature "Experiments", :type => :feature do
  let!(:staff) { User.create!(email: 'jjoyce2@me.com', username: 'staff', password: 'password', faculty: false) }
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'staff', password: 'password', faculty: true) }
  let!(:rp) { Category.create!(name: "Risk Perception") }
  let!(:prop) { Proposal.create!(title: Faker::Lorem.sentence, hypothesis: Faker::Lorem.paragraph, active: true, summary: Faker::Lorem.paragraph, faculty_id: fac.id, category_id: rp.id) }


  scenario "click on new experiment link" do
    allow(User).to receive(:find_by_id).and_return(staff)
    visit proposal_path(prop)
    click_button('Create an experiment')
    expect(current_path).to eq(new_experiment_path)
  end

  scenario "create new experiment" do
    allow(User).to receive(:find_by_id).and_return(staff)
    visit new_experiment_path(proposal_id: prop.id)
    fill_in('Title', with: 'New exp')
    fill_in('Procedure', with: 'oh man so much procedure')
    fill_in('Results', with: 'I got some data')
    fill_in('Conclusion', with: "I'm a genius!")
    click_button('Create!')
    expect(current_path).to eq(experiment_path(Experiment.last))
  end

  scenario "click on show experiment link"
    # allow(User).to receive(:find_by_id).and_return(staff)
    # visit proposal_path

  scenario "create observation"
    # allow(User).to receive(:find_by_id).and_return(staff)

  scenario "delete observation"
    # allow(User).to receive(:find_by_id).and_return(staff)
end
