Given(/^I am on the homepage$/) do
  visit('/')
end
Given(/^I want to Log in$/) do
  visit('/')
end

When(/^I press Log in$/) do
  click_link('Log In')
end

Then(/^I should be able to Log in$/) do
  expect(page).to have_content('Please enter your login details')
end
Given(/^I want to Sign Up$/) do
  visit('/')
end

Given(/^I want to join my MDT chat$/) do
  expect(page).to have_content 'London MDT'
end

When(/^I press my MDT$/) do
  click_link('London MDT')
end

Then(/^I should see my MDT chat room$/) do
  expect(page).to have_content 'Welcome to London MDT chat'
end
