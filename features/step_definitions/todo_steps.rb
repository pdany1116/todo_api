# frozen_string_literal: true

# Arranges

Given 'a todo exists' do
  create_todo('todos/requests/create.json')
end

Given 'no todos exist' do
  delete_todos
end

# Actions

When 'I create a todo' do
  create_todo('todos/requests/create.json')
end

When 'I retrieve the list of todos' do
  get_todos
end

When 'I retrieve that todo' do
  get_todo(@last_todo_id)
end

When 'I update that todo' do
  update_todo(@last_todo_id, 'todos/requests/update.json')
end

When 'I update the {string} field of that todo' do |field|
  update_todo(@last_todo_id, "todos/requests/update_#{field}.json")
end

When 'I delete all todos' do
  delete_todos
end

When 'I create a todo with {string} field' do |field|
  filename = "todos/requests/create_with_#{field.split.join('_')}.json"

  create_todo(filename)
end

When 'I retrieve the todo with id {int}' do |id|
  get_todo(id)
end

When 'I delete that todo' do
  delete_todo(@last_todo_id)
end

# Asserts

Then 'I will get a response with a list containing {int} todo(s)' do |count|
  expect(parsed_body.length).to be count
end

Then 'I will get a response with that todo' do
  expect(parsed_body[:id]).to be @last_todo_id
end

Then 'I will get a response with the created todo' do
  args = { id: @last_todo_id, url: todos_url_for(@last_todo_id) }

  expect(parsed_body).to eq hash_from_json_file('todos/responses/create.json', args)
end

Then 'I will get a response with the updated todo' do
  args = { id: @last_todo_id, url: todos_url_for(@last_todo_id) }

  expect(parsed_body).to eq hash_from_json_file('todos/responses/update.json', args)
end

Then 'I will get a response with that todo with {string} field updated' do |field|
  args = { id: @last_todo_id, url: todos_url_for(@last_todo_id) }

  expect(parsed_body).to eq hash_from_json_file("todos/responses/update_#{field}.json", args)
end

Then 'It should respond with no content' do
  expect(last_response.status).to eq 204
end

Then 'It should respond with not found' do
  expect(last_response.status).to eq 404
end

Then 'It should respond with unprocessable entity' do
  expect(last_response.status).to eq 422
end

Then 'I will get a response with {string} error message' do |error|
  filename = "todos/responses/#{error.split.join('_')}_error.json"

  expect(parsed_body).to eq hash_from_json_file(filename)
end
