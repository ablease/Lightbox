Feature: Signing up
  As a Doctor
  I want to login to Lightbox
  In order to communicate with other MDT

  Scenario: Filling the login form
    And  I have insert my email
    And I have insert my password
    When I click login
    Then I should see a welcome message
