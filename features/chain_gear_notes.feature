Feature: Chain gear notes
  In order to add notes to my gear
  As a user
  I want I want to edit my notes

  Scenario: When not logged in
    Given I am not logged in
    And a chain exists with name: "Not my chain"
    And a preamp exists
    And a mic exists
    And a chain gear exists with gear: the preamp, chain: the chain
    And a chain gear exists with gear: the mic, chain: the chain
    When I go to the chain's page
    Then I should not see "edit notes"

  Scenario: On my chain
    Given I am logged in as "test@example.com/password"
    And I have started a chain named "Awesome New Chain"
    And I have added a preamp to "Awesome New Chain"
    When I view the chain named "Awesome New Chain"
    And I follow "edit notes"
    And I fill in "Notes" with "Some notes"
    And I press "Save"
    And I view the chain named "Awesome New Chain"
    Then I should be viewing the chain "Awesome New Chain"
    And I should see "Some notes"
