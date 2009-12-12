Feature: Edit profile
  In order to change my information
  As a user
  I want to edit my profile

  Scenario: When not logged in
    Given I am not logged in
    When I go to the edit profile page
    Then I should see "You must be logged in to access this page"
    And I should be on the login page

  Scenario: When logged in
    Given I am logged in as "test/password"
    When I go to the edit profile page
    Then I should see "Stats"
    And I should see "4 Chains"
    And I should see "15 Followers"
    And I should see "30 Comments"
    And I should see "20 Likes"
    And I should see "13 Gear recommendations"
    

  Scenario: When logged in
    Given I am logged in as "test/password"
    When I go to the edit profile page
    And I fill in "Login" with "test2"
    And I fill in "Display name" with "Test User"
    And I fill in "Email" with "test2@example.com"
    And I fill in "Change password" with "new_password"
    And I fill in "Password Confirmation" with "new_password"
    And I attach "avatar.jpg" to "Profile Photo"
    And I press "Update"
    Then I should be on the edit profile page
    And I should see "Account updated successfully"
    And I should see "test2"
    And I should see "Test User"
    And I should see "test2@example.com"
    And I should not see "new_password"
