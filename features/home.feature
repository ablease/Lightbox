Feature: The homepage
    As a Doctor
    I want to login to Lightbox
    So that I can communicate with my MDT

    Scenario: Logging in
      Given I am on the homepage
      And I want to Sign Up
      When I press Sign Up
      Then I should be able to Sign Up
    
    Scenario: When a Doctor is logged in
      Given I am on the homepage
      And I want to join my MDT chat
      When I press my MDT
      Then I should see my MDT chat room
     
