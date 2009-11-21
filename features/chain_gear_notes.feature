Feature: Chain gear notes
  In order to add notes to my gear
  As a user
  I want I want to edit my notes

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
