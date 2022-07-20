Feature: Todo API
  As a user
  I want to manage todos

  Scenario: Get all todos
    Given a todo exists
    When I retrieve the list of todos
    Then I will get a response with a list containing 1 todo

  Scenario: Get a todo
    Given a todo exists
    When I retrieve that todo
    Then I will get a response with that todo

  Scenario: Create a todo
    When I create a todo
    Then I will get a response with the created todo

  Scenario: Delete a todo
    Given a todo exists
    When I delete that todo
    Then It should respond with no content
    When I retrieve that todo
    Then It should respond with not found

  Scenario: Delete all todos
    Given a todo exists
    When I delete all todos
    Then It should respond with no content
    When I retrieve the list of todos
    Then I will get a response with a list containing 0 todos

  Scenario: Update title, completed and order fields of a todo
    Given a todo exists
    When I update that todo
    Then I will get a response with the updated todo

  Scenario: Update the title field of a todo
    Given a todo exists
    When I update the 'title' field of that todo
    Then I will get a response with that todo with 'title' field updated

  Scenario: Update the order field of a todo
    Given a todo exists
    When I update the 'order' field of that todo
    Then I will get a response with that todo with 'order' field updated

  Scenario: Update the completed field of a todo
    Given a todo exists
    When I update the 'completed' field of that todo
    Then I will get a response with that todo with 'completed' field updated
