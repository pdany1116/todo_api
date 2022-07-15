Feature: Todo API
  As a user
  I want to manage todos

  Scenario: Get all todos
    Given a todo exists
    When I retrieve the list of todos
    Then I will get a response with a list containing a todo

  Scenario: Get a todo
    Given a todo exists
    When I retrieve that todo
    Then I will get a response with that todo

  Scenario: Create a todo
    When I create a todo
    Then I will get a response with the created todo
