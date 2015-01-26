Feature: Signing up
	As a Doctor
	I want to sign up to Lightbox
	In order to communicate with my MDT

	Scenario: Filling the form
		Given I have entered my name
		And  I have entered my email
		And I have entered my password
		And I have entered my medical registration number
		When I click sign up
		Then I should see a success message
