Feature: Manage todo list
  In order to scope my todo items
  As a User
  ISBAT CRUD my todo lists

  Background:
    Given I am logged in as "user@example.com"

  Scenario: Going to the todo list page
    Given I am on the home page
    When I follow "New todo list"
    Then I should be on the new todo list page

  Scenario: Creating a todo list
    Given I am on the new todo list page
    When I fill in "Name" with "my todo list"
    And I press "Create"
    Then I should be on the todo list page for "my todo list" for user with email "user@example.com"
    And I should see "my todo list"
    And "user@example.com" should have a todo list named "my todo list"

  Scenario: Respond with error message if todo list with same name exists
    Given the following todo lists exist
      | Name            | User             |
      | my todo list    | user@example.com |
    And I am on the new todo list page
    When I fill in "Name" with "my todo list"
    And I press "Create"
    Then I should see "Name is already taken"

  Scenario: Going to the todo list index page
    Given the following todo lists exist
      | Name            | User             |
      | my todo list    | user@example.com |
      | my todo list2   | user@example.com |
      | some other list | someone@else.com |
    When I go to the home page
    Then I should be on the todo lists page
    And I should see "my todo list"
    And I should see "my todo list2"
    But I should not see "some other list"
