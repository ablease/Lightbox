require 'spec_helper'
require 'helpers'

feature "User Sign up" do

  scenario 'As a new user visiting the site ' do
    sign_up('test', 'Test@test.com', 'test', 'test', '1111111')
    expect(page).to have_content('Successfully signed up')
    expect(User.first.email).to eq 'Test@test.com'
  end

  scenario 'with a password that doesnt match' do
    sign_up('test', 'test@test.com', 'test', 'nomatch', '1111111') 
    expect(page).to have_content("Your password doesn't match, please try again")
  end
  
  scenario 'with a gmc number that is not found' do
    sign_up('test', 'test@test.com', 'password', 'password', '1234567')
    expect(page).to have_content("That gmc number was not found")
  end

  scenario 'with a gmc number that does not match their name' do
    sign_up('bad_name', 'test@test.com', 'test', 'test', '1111111')    
    expect(page).to have_content("The name and GMC number you provided do not match")
  end
end

feature "User Log In" do

  before :each do
    sign_up('test', 'Test@test.com', 'test', 'test', '1111111')
  end 

  scenario 'with email and password that match' do
    log_in("Test@test.com", "test")
    expect(page).to have_content('Successfully logged in')
    expect(User.first.email).to eq 'Test@test.com'
  end

  scenario 'with an email and password that do not match' do
    log_in("Test@test.com", "wrongpass")
    expect(page).to have_content("The email or password are incorrect")
  end

  scenario 'on succesful login, user should see MDTs that they belong to' do
    log_in("Test@test.com", "test")
    add_room("London")
    expect(page).to have_content("London")
  end
end

feature "User Log out" do 

  before :each do 
    sign_up('test', 'Test@test.com', 'test', 'test', '1111111')
    log_in("Test@test.com", "test")
  end

  scenario "while users are signed in they can log out" do 
    click_button('Log out')
    expect(page).to have_content("Goodbye!")
  end
end

