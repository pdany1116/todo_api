# frozen_string_literal: true

# Arranges

Given 'a todo exists' do
  create_todo
end

Given 'I created a todo' do
  post_todo
end

# Actions

When 'I retrieve the list of todos' do
  get_todos
end

When 'I retrieve that todo' do
  get_todo(@last_todo_id)
end

# Asserts

Then 'I will get a response with a list containing a todo' do
  expect(parsed_body.length).to be 1
end

Then 'I will get a response with that todo' do
  expect(parsed_body['id']).to be @last_todo_id
end
