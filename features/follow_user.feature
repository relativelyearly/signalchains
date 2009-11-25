Feature: Follow user
  In order to see what my friends are doing
  As a user
  I want to follow another user

  Scenario: Not logged in
    Given I am not logged in
    And a user exists with email: "friend@example.com"
    When I go to the user page
    Then I should not see "follow"

  Scenario: Logged in without following
    Given I am logged in as "test@example.com/password"
    And a user exists with email: "friend@example.com"
    When I go to the user page
    And I follow "follow"
    Then I should be on the user page
    And I should see "unfollow"

  Scenario: Logged in currently following
    Given I am logged in as "test@example.com/password"
    And a user exists with email: "friend@example.com"
    And I have followed the user
    When I go to the user page
    And I follow "unfollow"
    Then I should be on the user page
    And I should see "follow"