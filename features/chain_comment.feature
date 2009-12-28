Feature: Chain comment
  In order to express my thoughts
  As a user
  I want to comment on a chain

  Scenario: When not logged in
    Given I am not logged in
    And there is a chain named "A chain I like"
    When I view the chain named "A chain I like"
    Then I should not see "Create Comment"

  Scenario: When logged in
    Given I am logged in as "test@example.com/password"
    And a chain exists with name: "A chain I like"
    When I go to the chain page
    And I fill in "comment_body" with "I really like this chain."
    And I press "Create Comment"
    Then I should be on the chain page
    And I should see "I really like this chain."
