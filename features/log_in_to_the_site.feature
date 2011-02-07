Feature: Log in to the site
  In order for Todo lists to be associated with particular users
  As a Guest
  ISBAT log in to the site

  Scenario: Guest goes to the log in page
    Given I am on the home page
    When I follow "Sign in"
    Then I should be on the new user session page
    And I should see "Email"
    And I should see "Password"

  Scenario: Guest logs in to the page
    Given a user exists with an email of "user@example.com"
    And I am on the new user session page
    When I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should be on the todo lists page
    And I should see "Signed in successfully."
