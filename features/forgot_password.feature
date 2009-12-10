Feature: Password reset
  In order to sign in even if user forgot their password
  A user
  Should be able to reset it
  
  Scenario: User is not signed up
    Given no user exists with an email of "email@email.com"
    When I go to the password reset page
    And I fill in "Email" with "email@email.com"
    And I press "Reset my password"
    Then I should see "No user was found with that email address"
  
  Scenario: User is signed up and requests password reset
    Given I am registered with "test@example.com/password"
    When I go to the password reset page
    And I fill in "Email" with "test@example.com"
    And I press "Reset my password"
    Then I should see "Instructions to reset your password have been emailed to you. Please check your email."
    And a password reset message should be sent to "test@example.com"
  
  Scenario: User resets their password
    Given I am registered with "test@example.com/password"
    When I request a password reset for "test@example.com"
    And I follow the password reset link sent to "test@example.com"
    And I fill in "Password" with "newpassword"
    And I fill in "Password confirmation" with "newpassword"
    And I press "Update my password and log me in"
    Then I should see "Password successfully updated"
    And I should be logged in
