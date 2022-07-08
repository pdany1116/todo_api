# frozen_string_literal: true

# Arranges

Given 'a todo exists' do
  create_todo
end

# Actions

When 'I retrieve the list of todos' do
  get_todos
end

# Asserts

Then 'I will get a response with a list containing a todo' do
  expect(parsed_body.length).to be 1
end
