Feature: Todo API
  As a user
  I want to manage todos

  Scenario: Get all todos
    Given a todo exists
    When I retrieve the list of todos
    Then I will get a response with a list containing a todo

  Scenario: Get a todo that I created
    Given I created a todo
    When I retrieve that todo
    Then I will get a response with that todo
