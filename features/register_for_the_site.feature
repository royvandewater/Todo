Feature: Register for the site
  In Order to have user accounts with which to associate todo lists
  As a Guest
  ISBAT create a user

  Scenario: Guest goes to the new user registration page
    Given I am on the new user session page
    When I follow "Sign up"
    Then I should be on the new user registration page
    And I should see "Email"
    And I should see "Password"
    And I should see "Password confirmation"

  Scenario: Guest registers for an account
    Given I am on the new user registration page
    When I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then  I should be on the todo lists page
    And I should see "Thank you for signing up"
    And I should see "You are now signed in"
    And a user should exist with an email of "user@example.com"
