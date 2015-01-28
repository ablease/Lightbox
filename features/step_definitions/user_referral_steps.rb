Given(/^I want Refer a Colleague$/) do
  visit'/'
end

When(/^I press Refer a Colleague$/) do
  click_link('Refer a Colleague')
end

Then(/^I should be able to Refer a Colleague$/) do
  expect(page).to have_content('Enter your Colleague\'s email below:')
end