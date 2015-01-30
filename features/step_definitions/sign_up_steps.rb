Given(/^I have entered my name$/) do
	visit('referral/ABCABCABCABCABCABCABCABCABCABCABCABCABCABCABCABCABCABCABCABCABCA')
	fill_in 'name', :with => "test example"
end

Given(/^I have entered my email$/) do
	fill_in 'email', :with => 'test@test.com'
end

Given(/^I have entered my password$/) do
	fill_in 'password', :with => 'test'
	fill_in 'password_confirmation', :with => 'test'
end

Given(/^I have entered my medical registration number$/) do
	fill_in 'gmc_number', :with => '1111111'
end

When(/^I click sign up$/) do
	click_button 'Sign Up'
end

Then(/^I should see a success message$/) do
	expect(page).to have_content('Successfully signed up')
end
