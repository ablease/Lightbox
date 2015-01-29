require 'spec_helper'
require 'helpers'

feature 'User wants to refer a colleague' do

  before(:each) {
    sign_up('test', 'Test@test.com', 'test', 'test', '1111111')
  }

  scenario 'by sending them an email' do
    click_link('Referral')
    fill_in :email, with: "test@test.com" 
    click_button 'Send'
    expect(page).to have_content('Email sent')
  end
end

