require 'rails_helper'

RSpec.feature "User visits website", :type => :feature do
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'fac', password: 'password', faculty: true) }
  let!(:staff) { User.create!(email: 'jjoyce2@me.com', username: 'staff', password: 'password', faculty: false) }

  scenario "sees log-in page" do
    visit root_path
    expect(page).to have_content('Please Log In')
  end

  scenario "can log in" do
    visit root_path
    fill_in('Username', with: 'fac')
    fill_in('Password', with: 'password')
    click_button('Submit')
    expect(current_path).to eq(user_path(fac))
  end

  scenario "can create new account" do
    visit root_path
    click_link('Click here to Sign Up')
    expect(current_path).to eq(new_user_path)
  end

end

RSpec.feature "Create new account", :type => :feature do
  scenario "creates faculty account" do
    visit new_user_path
    fill_in('Username', with: 'fac')
    fill_in('Email', with: 'jjoyce1@me.com')
    fill_in('Password', with: 'password')
    fill_in('Secret code', with: 'faculty')
    click_button('Submit')
    expect(page).to have_content('Faculty Homepage')
    expect(page).to have_button('Log out')
  end

  scenario "creates staffer account" do
    visit new_user_path
    fill_in('Username', with: 'staff')
    fill_in('Email', with: 'jjoyce2@me.com')
    fill_in('Password', with: 'password')
    fill_in('Secret code', with: 'staffer')
    click_button('Submit')
    expect(page).to have_content('Staffer Homepage')
    expect(page).to have_button('Log out')
  end

end

RSpec.feature "Log out", :type => :feature do
  let!(:fac) { User.create!(email: 'jjoyce1@me.com', username: 'fac', password: 'password', faculty: true) }
  let!(:staff) { User.create!(email: 'jjoyce2@me.com', username: 'staff', password: 'password', faculty: false) }

  scenario "logs out and redirects to home page" do
    visit root_path
    fill_in('Username', with: 'fac')
    fill_in('Password', with: 'password')
    click_button('Submit')
    click_button('Log out')
    expect(current_path).to eq(root_path)
  end

end

