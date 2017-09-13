require 'rails_helper'

feature 'user creates new account' do

  let!(:user1) { FactoryGirl.create(:user1) }

  scenario 'unauthenticated user visits homepage' do
    visit new_user_session_path

    expect(page).to have_content("Log in Email")
  end

  scenario 'user successfully creates account' do
    visit new_user_session_path

    click_button 'Sign up'

    fill_in 'Username', with: user1.username
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    fill_in 'Password confirmation', with: user1.password

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
