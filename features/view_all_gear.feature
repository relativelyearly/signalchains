Feature: View all gear
  In order see a list of all gear in the database
  As a user
  I want view the gear page

  Scenario: Viewing the gear page
    When I go to the gear page
    I should see "Type"
    And I should see "Microphones"
    And I should see "Preamps"
    And I should see "Dynamics"
    And I should see "Equalizers"
    And I should see "Effects"

  Scenario: Viewing a type of gear
    When I go to the gear page
    And I follow "Microphones"
    Then I should be on the Microphones page
    And I should see "Make"
    And I should see "Model"
    And I should see "Type"
    And I should see "Diaphragm Size"
    And I should see "Pattern"