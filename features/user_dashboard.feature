Feature: User dashboard
  In order to see what's happened
  As a user
  I want to view events on a dashboard

  @current
  Scenario: Someone I follow leaves a comment
    Given I am logged in as "test@example.com/password"
    And a user exists with email: "friend@example.com"
    And a chain exists with name: "A really awesome chain"
    And I have followed the user
    And a comment exists with user: the user, commentable: the chain, body: "What an awesome chain."
    When I go to the homepage
    Then I should see "friend@example.com"
    And I should see "A really awesome chain"
    And I should see "What an awesome chain."

  @current
  Scenario: Someone leaves a comment on a chain I created
    Given I am logged in as "test@example.com/password"
    And a chain exists with name: "A really awesome chain", user: the user
    And a user exists with email: "stranger@example.com"
    And a comment exists with user: the user, commentable: the chain, body: "What an awesome chain."
    When I go to the homepage
    Then I should see "stranger@example.com"
    And I should see "A really awesome chain"
    And I should see "What an awesome chain."

  @current
  Scenario: Someone I follow creates a chain
    Given I am logged in as "test@example.com/password"
    And a user exists with email: "friend@example.com"
    And I have followed the user
    And a chain exists with name: "A really awesome chain", user: the user
    When I go to the homepage
    Then I should see "friend@example.com"
    And I should see "created"
    And I should see "A really awesome chain"

  @pending
  Scenario: Someone I follow recommends some gear

  @current
  Scenario: I comment on a chain
    Given I am logged in as "test@example.com/password"
    And a chain exists with name: "A really awesome chain"
    And a comment exists with user: the user, commentable: the chain, body: "What an awesome chain."
    When I go to the homepage
    And I should not see "A really awesome chain"
    And I should not see "What an awesome chain."

  @current
  Scenario: Viewing another user's profile who left a comment
    Given a user exists with email: "friend@example.com"
    And a chain exists with name: "A really awesome chain"
    And a comment exists with user: the user, commentable: the chain, body: "What an awesome chain."
    When I go to the user page
    Then I should see "friend@example.com"
    And I should see "A really awesome chain"
    And I should see "What an awesome chain."

  @current
  Scenario: Viewing another user's profile who created a chain
    Given I am logged in as "test@example.com/password"
    Given a user exists with email: "friend@example.com"
    And a chain exists with name: "A really awesome chain", user: the user
    When I go to the user page
    Then I should see "friend@example.com"
    And I should see "created"
    And I should see "A really awesome chain"