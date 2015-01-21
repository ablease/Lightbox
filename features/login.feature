Feature: Logging in
  As a Doctor
  I want to login to Lightbox
  In order to communicate with other MDT

  Scenario: Filling in the login form
    Given  I have inserted my email
    And I have inserted my password
    When I click login
    Then I should see a welcome message
