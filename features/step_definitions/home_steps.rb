Given(/^I want to Sign Up$/) do
  visit('/')
end

When(/^I press Sign Up$/) do
  click_link('Sign Up')
end

Then(/^I should be able to Sign Up$/) do
  visit('/sign_up')
end
