Feature: Login
  In order to gain access to protected areas of the site
  As a user
  I want to be able to log in

  Scenario: User is registered with email
    Given I am registered with "test@example.com/password"
    When I go to the login page
    And I fill in "user_session_login" with "test@example.com"
    And I fill in "password" with "password"
    And I press "Login"
    Then I should see "Login successful!"
    And I should be logged in

  Scenario: User is registered with login
    Given I am registered with "test/password"
    When I go to the login page
    And I fill in "user_session_login" with "test"
    And I fill in "password" with "password"
    And I press "Login"
    Then I should see "Login successful!"
    And I should be logged in

  Scenario: User is registered and puts in the wrong password
    Given I am registered with "test@example.com/password"
    When I go to the login page
    And I fill in "user_session_login" with "test@example.com"
    And I fill in "password" with "incorrect"
    And I press "Login"
    Then I should see "Invalid username or password"
    And I should not be logged in

  Scenario: User is not registered
    Given no user exists with an email of "test@example.com"
    When I go to the login page
    And I fill in "user_session_login" with "test@example.com"
    And I fill in "password" with "password"
    And I press "Login"
    Then I should see "Invalid username or password"
    And I should not be logged in
