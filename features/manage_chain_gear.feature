Feature: Manage chain gear
  In order to update my chain
  As a user
  I want to manage the gear

  Scenario: When not logged in
    Given I am not logged in
    And a chain exists
    And the chain is complete
    When I go to the chain's page
    Then I should not see "delete"

  Scenario: When logged in view another user's chain
    Given I am logged in as "test/password"
    And a chain exists
    And a preamp exists
    And a chain gear exists with gear: the preamp, chain: the chain
    When I go to the chain's page
    Then I should not see "delete"

  Scenario: When logged in on my chain
    Given I am logged in as "test/password"
    And a chain exists with user: the user
    And a preamp exists with model: "PA101"
    And a chain gear exists with gear: the preamp, chain: the chain
    When I go to the chain's page
    And I follow "delete gear"
    Then I should be on the chain's page
    And I should not see "PA101"