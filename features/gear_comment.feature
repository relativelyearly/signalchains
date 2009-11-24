Feature: Gear comment
  In order to express my thoughts
  As a user
  I want to comment on a gear

  @current
  Scenario: When not logged in
    Given I am not logged in
    And a mic exists with make: "Horrible", model: "Mic"
    When I go to the mic page
    Then I should not see "Create Comment"

  @current
  Scenario: When logged in on a mic
    Given I am logged in as "test@example.com/password"
    And a mic exists with make: "Horrible", model: "Mic"
    When I go to the mic page
    And I fill in "comment_body" with "I really hate this mic."
    And I press "Create Comment"
    Then I should be on the mic page
    And I should see "I really hate this mic."

  @current
  Scenario: When logged in on a preamp
    Given I am logged in as "test@example.com/password"
    And a preamp exists with make: "Horrible", model: "Preamp"
    When I go to the preamp page
    And I fill in "comment_body" with "I really hate this preamp."
    And I press "Create Comment"
    Then I should be on the preamp page
    And I should see "I really hate this preamp."

  @current
  Scenario: When logged in on a dynamics processor
    Given I am logged in as "test@example.com/password"
    And a dynamics processor exists with make: "Horrible", model: "Dynamics Processor"
    When I go to the dynamics processor page
    And I fill in "comment_body" with "I really hate this dynamics processor."
    And I press "Create Comment"
    Then I should be on the dynamics processor page
    And I should see "I really hate this dynamics processor."

  @current
  Scenario: When logged in on a effects processor
    Given I am logged in as "test@example.com/password"
    And a effects processor exists with make: "Horrible", model: "Effects Processor"
    When I go to the effects processor page
    And I fill in "comment_body" with "I really hate this effects processor."
    And I press "Create Comment"
    Then I should be on the effects processor page
    And I should see "I really hate this effects processor."

  @current
  Scenario: When logged in on a equalizer
    Given I am logged in as "test@example.com/password"
    And a equalizer exists with make: "Horrible", model: "Equalizer"
    When I go to the equalizer page
    And I fill in "comment_body" with "I really hate this equalizer."
    And I press "Create Comment"
    Then I should be on the equalizer page
    And I should see "I really hate this equalizer."