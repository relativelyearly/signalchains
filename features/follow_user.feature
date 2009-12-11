Feature: Follow user
  In order to see what my friends are doing
  As a user
  I want to follow another user

  @current
  Scenario: Not logged in
    Given I am not logged in
    And a user exists with login: "friend"
    When I go to friend's profile page
    Then I should not see "follow"

  @current
  Scenario: Logged in without following
    Given I am logged in as "test@example.com/password"
    And a user exists with login: "friend"
    When I go to friend's profile page
    And I follow "follow"
    Then I should be on friend's profile page
    And I should see "unfollow"

  @current
  Scenario: Logged in currently following
    Given I am logged in as "test@example.com/password"
    And a user exists with login: "friend"
    And I have followed the user
    When I go to friend's profile page
    And I follow "unfollow"
    Then I should be on friend's profile page
    And I should see "follow"