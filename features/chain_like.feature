Feature: Chain like
  In order to remember chains I like
  As a user
  I want to like a chain

  Scenario: When not logged in
    Given I am not logged in
    And a chain exists
    When I go to the chain's page
    And I follow "like"
    Then I should be on the login page

  Scenario: When logged in
    Given I am logged in as "test@example.com/password"
    And a chain exists
    When I go to the chain's page
    And I follow "like"
    Then I should be on the chain's page
    And I should have liked the chain

  Scenario: When logged in and previously liked
    Given I am logged in as "test@example.com/password"
    And a chain exists
    And I have liked that chain
    When I go to the chain's page
    And I follow "unlike"
    Then I should be on the chain's page
    And I should have unliked the chain
  
  