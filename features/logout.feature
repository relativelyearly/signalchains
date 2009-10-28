Feature: Logout
  In order to prevent others from using my account
  As a User
  I want to be able to log out

  Scenario: When logged in
    Given I am logged in as "test@example.com/password"
    When I go to the logout page
    Then I should see "Logout successful!"
    And I should not be logged in
  
  Scenario: When not logged in
    Given I am not logged in
    When I go to the logout page
    Then I should see "You must be logged in to access this page"
    And I should not be logged in