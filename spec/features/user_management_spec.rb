require 'spec_helper'
require 'helpers'

feature "User Sign up" do

  scenario 'As a new user visiting the site ' do
    expect{ sign_up('Test@test.com', 'test', 'test', '1111111') }.to change(User, :count).by 1
    expect(page).to have_content('Welcome Test@test.com')
    expect(User.first.email).to eq 'Test@test.com'
  end

  scenario 'with a password that doesnt match' do
    expect{ sign_up('test@test.com', 'test', 'nomatch', '1111111') }.to change(User, :count).by(0)
  end
  
  scenario 'with a gmc number that is not found' do
    sign_up('test@test.com', 'password', 'password', '1234567')
    expect(page).to have_content("That gmc number was not found")
  end

  scenario 'with a gmc number that does not match their name' do
    
  end

end

feature "User Log In" do

  scenario 'with email and password that match' do
    expect{ sign_up('Test@test.com', 'test', 'test', '1111111') }.to change(User, :count).by 1
    log_in("Test@test.com", "test")
    expect(page).to have_content('Successfully logged in')
    expect(User.first.email).to eq 'Test@test.com'
  end

  scenario 'with an email and password that do not match' do
    sign_up('Test@test.com', 'test', 'test', '1111111')
    log_in("Test@test.com", "wrongpass")
    expect(page).to have_content("The email or password are incorrect")
  end

  scenario 'on succesful login, user should see MDTs that they belong to' do
    sign_up('Test@test.com', 'test', 'test', '1111111')
    log_in("Test@test.com", "test")
    add_room("London")
    expect(page).to have_content("London")
  end
end

feature "User Log out" do 

  before(:each) do 
    sign_up('Test@test.com', 'test', 'test', '2575276')
    log_in("Test@test.com", "test")
  end

  scenario "while users are signed in they can log out" do 
    click_button('Log out')
    expect(page).to have_content("Goodbye!")
  end

end

