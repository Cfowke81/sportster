require 'rails_helper'

feature 'user interacts with profile page' do

  let!(:user1) { FactoryGirl.create(:user) }

  scenario 'user visits profile page' do
    visit root_path
    click_link('Log in')

    visit new_user_session_path
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'

    visit root_path
    click_link('Profile')

    visit user_path(user1)

    expect(page).to have_content("Recent Games")
  end

  # scenario 'user '
end
