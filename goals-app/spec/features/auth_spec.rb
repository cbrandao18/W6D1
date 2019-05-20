require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end
    
  feature 'signing up a user' do
    before(:each) do
        visit new_user_url
        fill_in 'Username', :with => "testing@email.com"
        fill_in 'Password', :with => "biscuits"
        click_on "Create User"
    end

    scenario 'shows username on the homepage after signup' do
        expect(page).to have_content "testing@email.com"
    end

  end
end

feature 'logging in' do
    given(:hello_world) { FactoryBot.create(:user_hw) }

    scenario 'shows username on the homepage after login' do
        visit new_session_url
        fill_in "Username", with: hello_world.username
        fill_in "Password", with: "password"
        click_button "Log In"
        expect(page).to have_content "hello_world"
    end
end

feature 'logging out' do
  
  given(:hello_world) { FactoryBot.create(:user_hw) }

  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).to have_content "Sign In"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    fill_in "Username", with: hello_world.username
    fill_in "Password", with: "password"
    click_button "Log In"

    click_button "Log Out"
    expect(page).not_to have_content "hello_world"
  end

end