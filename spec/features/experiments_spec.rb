require 'rails_helper'

RSpec.feature "Experiments", :type => :feature do
  let!(:staff) { User.create!(email: 'jjoyce2@me.com', username: 'staff', password: 'password', faculty: false) }

  scenario "create new experiment"
  allow(User).to receive(:find_by_id).and_return(fac)

  scenario "click on experiment link"
  allow(User).to receive(:find_by_id).and_return(fac)

  scenario "create observation"
  allow(User).to receive(:find_by_id).and_return(fac)

  scenario "delete observation"
  allow(User).to receive(:find_by_id).and_return(fac)
end
