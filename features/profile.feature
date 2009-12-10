Feature: Profile
  In order to see other people's chains
  As a user
  I want to view their profile

  Scenario: When not logged in
    Given I am not logged in
    And a user exists with login: "signalchains_user"
    When I go to signalchains_user's profile page
    Then I should see "signalchains_user"