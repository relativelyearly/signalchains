Feature: User dashboard
  In order to see what's happened
  As a user
  I want to view events on a dashboard

  Scenario: Someone I follow leaves a comment
    Given I am logged in as "test@example.com/password"
    And a user exists with login: "bob"
    And a chain exists with name: "A really awesome chain"
    And I have followed the user
    And a comment exists with user: the user, commentable: the chain, body: "What an awesome chain."
    When I go to the homepage
    Then I should see "bob"
    And I should see "A really awesome chain"
    And I should see "What an awesome chain."

  Scenario: Someone leaves a comment on a chain I created
    Given I am logged in as "test@example.com/password"
    And a chain exists with name: "A really awesome chain", user: the user
    And a user exists with login: "bob"
    And a comment exists with user: the user, commentable: the chain, body: "What an awesome chain."
    When I go to the homepage
    Then I should see "bob"
    And I should see "A really awesome chain"
    And I should see "What an awesome chain."

  Scenario: Someone I follow creates a chain
    Given I am logged in as "test@example.com/password"
    And a user exists with login: "bob"
    And I have followed the user
    And a chain exists with name: "A really awesome chain", user: the user
    And the chain is complete
    When I go to the homepage
    Then I should see "bob"
    And I should see "created a new chain"
    And I should see "A really awesome chain"

  @current
  Scenario: Someone I follow follows someone
    Given I am logged in as "test@example.com/password"
    And a user: "bob" exists with login: "bob"
    And I have followed the user
    And a user: "rob" exists with login: "rob"
    And a follow exists with user: user "bob", followed: user "rob"
    When I go to the homepage
    Then I should see "bob"
    And I should see "is now following"
    And I should see "rob"

  @pending
  Scenario: Someone I follow recommends some gear

  Scenario: I comment on a chain
    Given I am logged in as "test@example.com/password"
    And a chain exists with name: "A really awesome chain"
    And a comment exists with user: the user, commentable: the chain, body: "What an awesome chain."
    When I go to the homepage
    And I should not see "A really awesome chain"
    And I should not see "What an awesome chain."

  Scenario: Viewing another user's profile who left a comment
    Given a user exists with login: "bob"
    And a chain exists with name: "A really awesome chain"
    And a comment exists with user: the user, commentable: the chain, body: "What an awesome chain."
    When I go to bob's profile page
    Then I should see "bob"
    And I should see "A really awesome chain"
    And I should see "What an awesome chain."

  Scenario: Viewing another user's profile who created a chain
    Given I am logged in as "test@example.com/password"
    Given a user exists with login: "bob"
    And a chain exists with name: "A really awesome chain", user: the user
    And the chain is complete
    When I go to bob's profile page
    Then I should see "bob"
    And I should see "created a new chain"
    And I should see "A really awesome chain"
  
  
  