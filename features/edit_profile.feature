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
    And I fill in "Username" with "test2"
    And I fill in "Display name" with "Test User"
    And I fill in "Email" with "test2@example.com"
    And I fill in "Change password" with "new_password"
    And I fill in "Password Confirmation" with "new_password"
    And I attach the file at "test/images/avatar.jpg" to "Avatar"
    And I press "Update"
    Then I should be on the edit profile page
    And I should see "Account updated successfully"
    And I should see "test2"
    And I should see "Test User"
    And I should see "test2@example.com"
    And I should not see "new_password"
