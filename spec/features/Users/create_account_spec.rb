require 'rails_helper'

feature 'user creates new account' do

  let!(:user1) { FactoryGirl.create(:user) }

  scenario 'unauthenticated user visits homepage' do
    visit new_user_session_path

    expect(page).to have_content("Log in Email")
  end

  scenario 'user successfully creates account' do
    visit new_user_session_path

    click_button 'Sign up'

    fill_in 'Username', with: "testuser2"
    fill_in 'First name', with: "Rick"
    fill_in 'Last name', with: "Deckard"
    fill_in 'Email', with: "testuser2@gmail.com"
    fill_in 'Password', with: "Changeme"
    fill_in 'Password confirmation', with: "Changeme"

    click_button 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario 'user unsuccessfully creates account' do
    visit new_user_session_path

    click_button 'Sign up'

    fill_in 'Username', with: user1.username
    fill_in 'Email', with: user1.email

    click_button 'Sign up'

    expect(page).to have_content("Password can't be blank")
  end

  scenario 'user successfully logs into their account' do
    visit new_user_session_path

    sign_in user1
    visit root_path

    expect(page).to have_content("#{user1.username}")
  end

  scenario 'user successfully logs out of their account' do
    visit new_user_session_path

    sign_in user1
    visit root_path
    sign_out user1
    visit root_path

    expect(page).to have_content("Log in Email")
  end
end
