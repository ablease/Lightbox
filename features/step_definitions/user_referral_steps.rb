Given(/^I want Refer a Colleague$/) do
  visit('/login')
  fill_in 'email', :with => "test@test.com"
  fill_in 'password', :with => 'test'
  click_button 'Log In'
end

When(/^I press Refer a Colleague$/) do
  click_link('Referral')
end

Then(/^I should be able to Refer a Colleague$/) do
  expect(page).to have_content('Enter your Colleague\'s email below:')
end