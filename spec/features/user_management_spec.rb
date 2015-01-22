require 'spec_helper'
require 'helpers'

feature "User Sign up" do

  scenario 'As a new user visiting the site ' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome Test@test.com')
    expect(User.first.email).to eq 'Test@test.com'
  end

  scenario 'with a password that doesnt match' do
    expect{ sign_up('example@email.com', 'password', 'nomatch') }.to change(User, :count).by(0)
  end

end

feature "User Log In" do

  scenario 'with email and password that match' do
    expect{ sign_up }.to change(User, :count).by 1
    log_in("Test@test.com", "test")
    expect(page).to have_content('Successfully logged in')
    expect(User.first.email).to eq 'Test@test.com'
  end

  scenario 'with an email and password that do not match' do
    log_in("Test@test.com", "wrongpass")
    expect(page).to have_content("The email or password are incorrect")
  end

  scenario 'on succesful login, user should see MDTs that they belongs to' do
    sign_up
    log_in("Test@test.com", "test")
    expect(page).to have_content("London MDT")
  end
end

feature "User Log out" do 

  before(:each) do 
    sign_up
    log_in("Test@test.com", "test")
  end

  scenario "while users are signed in they can log out" do 
    click_button('Log out')
    expect(page).to have_content("Goodbye!")
  end

end

