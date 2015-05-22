require 'rails_helper'

RSpec.feature "Categories", :type => :feature do
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'fac', password: 'password', faculty: true) }
  let!(:rp) { Category.create!(name: "Risk Perception") }
  scenario "sees index of categories" do
    allow(User).to receive(:find_by_id).and_return(fac)
    visit categories_path
    expect(page).to have_content('Categories')
  end

  scenario "clicks on category button" do
    allow(User).to receive(:find_by_id).and_return(fac)
    visit categories_path
    click_link('Risk Perception')
    expect(current_path).to eq(category_path(rp))
  end
end
