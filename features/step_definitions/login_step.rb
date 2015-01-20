Then(/^I have insert my email$/) do
  visit('/login')
  fill_in 'email', :with => "Test@test.com"
end

Then(/^I have insert my password$/) do
  fill_in 'password', :with => 'test'
end

When(/^I click login$/) do
  click_button 'Log In'
end

Then(/^I should see a welcome message$/) do
  expect(page).to have_content('Successfully logged in')
end
