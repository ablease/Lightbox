require 'spec_helper'

feature "User Sign up" do

  scenario 'As a new user visiting the site ' do

    def sign_up(email='Test@test.com', password='test')
      visit '/sign_up'
      expect(page.status_code).to eq 200
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Sign Up'
    end


    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome Test@test.com')
    expect(User.first.email).to eq 'Test@test.com'

  end


end
