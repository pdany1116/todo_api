# frozen_string_literal: true

require './lib/json_helpers'

module TodoHelpers
  include FactoryBot::Syntax::Methods

  def create_todo
    post todos_path, hash_from_json_file('todos/requests/create.json')
    @last_todo_id = parsed_body[:id]
  end

  def get_todos
    get todos_path
  end

  def get_todo(id)
    get todo_path(id)
  end

  def delete_todos
    delete todos_path
  end

  def delete_todo(id)
    delete todo_path(id)
  end

  def update_todo(id, filename)
    patch todo_path(id), hash_from_json_file(filename)
    @last_todo_id = parsed_body[:id]
  end

  def todos_url_for(id)
    "#{ENV.fetch('HOST_URL')}/#{id}"
  end

  def hash_from_json_file(filename, args = {})
    return JsonHelpers::Parser.new(SHARED_DIR.join(filename)).to_hash if args.empty?

    content = JsonHelpers::Formatter.new(SHARED_DIR.join(filename)).format_content(args)

    JsonHelpers::Parser.to_hash(content)
  end
end
