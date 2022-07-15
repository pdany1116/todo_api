# frozen_string_literal: true

# Arranges

Given 'a todo exists' do
  create_todo
end

# Actions

When 'I create a todo' do
  create_todo
end

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

Then 'It should respond with the created todo' do
  formatter = JsonHelpers::Formatter.new(SHARED_DIR.join('todos/responses/create.json'))
  args = { id: @last_todo_id, url: todos_url_for(@last_todo_id) }
  expected_response = JSON.parse(formatter.format_content(args), symbolized_names: true)

  expect(parsed_body).to eq expected_response
end
