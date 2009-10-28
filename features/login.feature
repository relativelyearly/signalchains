Feature: Login
  In order to gain access to protected areas of the site
  As a user
  I want to be able to log in
  
  Scenario: User is registered
    Given I am registered with "test@example.com/password"
    When I go to the login page
    And I fill in "email" with "test@example.com"
    And I fill in "password" with "password"
    And I press "Login"
    Then I should see "Login successful!"
    And I should be logged in
    
  Scenario: User is registered and puts in the wrong password
    Given I am registered with "test@example.com/password"
    When I go to the login page
    And I fill in "email" with "test@example.com"
    And I fill in "password" with "incorrect"
    And I press "Login"
    Then I should see "Password is not valid"
    And I should not be logged in
  
  Scenario: User is not registered
    Given no user exists with an email of "test@example.com"
    When I go to the login page
    And I fill in "email" with "test@example.com"
    And I fill in "password" with "password"
    And I press "Login"
    Then I should see "Email is not valid"
    And I should not be logged in
