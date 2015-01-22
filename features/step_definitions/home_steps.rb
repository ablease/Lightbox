Given(/^I want to Sign Up$/) do
  visit('/')
end

When(/^I press Sign Up$/) do
  click_link('Sign Up')
end

Then(/^I should be able to Sign Up$/) do
  visit('/sign_up')
end

#Given(/^I want to join my MDT chat$/) do
#  expect(page).to have_content 'London MDT'
#end
#
#When(/^I press my MDT$/) do
#  click_link('London MDT')
#end
#
#Then(/^I should see my MDT chat room$/) do
#  expect(page).to have_content 'Welcome to London MDT chat'
#end
