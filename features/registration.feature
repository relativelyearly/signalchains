Feature: User Registration
  In order to keep my settings
  As a new user
  I want to be able to register.

  Scenario: Registering a new user
    Given I am not logged in
    And no user exists with an email of "test@example.com"
    And no user exists with the login "test"
    When I go to the registration page
    And I fill in "Username" with "test"
    And I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Account registered!"
    And I should be logged in

  Scenario: Registering with an existing email address
    Given I am not logged in
    And I am registered with "test@example.com/password"
    When I go to the registration page
    And I fill in "Username" with "test"
    And I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Email has already been taken"
    And I should not be logged in

  Scenario: Registering with an existing login
    Given I am not logged in
    And I am registered with "test/password"
    When I go to the registration page
    And I fill in "Username" with "test"
    And I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Register"
    Then I should see "Login has already been taken"
    And I should not be logged in