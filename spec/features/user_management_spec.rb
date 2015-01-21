require 'spec_helper'


def sign_up(email='Test@test.com', password='test', password_confirmation="test")
  visit '/sign_up'
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end

def log_in
  visit '/login'
  expect(page.status_code).to eq 200
  fill_in :email, with: "Test@test.com"
  fill_in :password, with: 'test'
  click_button 'Log In'
end
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
    log_in
    expect(page).to have_content('Successfully logged in')
    expect(User.first.email).to eq 'Test@test.com'
  end
end
