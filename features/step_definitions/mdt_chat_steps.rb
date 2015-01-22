Given(/^I want to join my MDT chat$/) do
  visit('/')
end

When(/^I press my MDT$/) do
  click_link('London MDT')
end

Then(/^I should see my MDT chat room$/) do
  expect(page).to have_content ("You are now chatting in London MDT")
end
