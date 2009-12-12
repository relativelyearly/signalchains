@pending
Feature: View all chains
  In order see a list of all chains by all users
  As a user
  I want view the chains page

  Scenario: Viewing the chains page
    When I go to the chains page
    Then I should see "Search Chains"
    And I should see "Top Chains"
    And I should see "Top Tags"
    And I should see "Awesome Guitar"
    And I should see "Song Name"
    And I should see "DJ Bad-Knee Bob"
    And I should see "1994"
    And I should see "A nice sounding setup for my guitar rig, man."

  Scenario: Searching the chains page
    When I go to the chains page
    And I fill in "Search" with "guitar"
    And I follow "Search Chains"
    Then I should see "Awesome Guitar"
    And I should see "Song Name"
    And I should see "DJ Bad-Knee Bob"
    And I should see "1994"
    And I should see "A nice sounding setup for my guitar rig, man."
