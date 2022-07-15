# frozen_string_literal: true

require './lib/json_helpers'

module TodoHelpers
  include FactoryBot::Syntax::Methods

  def create_todo
    post todos_path, JsonHelpers::Parser.new(SHARED_DIR.join('todos/requests/create.json')).to_hash
    @last_todo_id = parsed_body['id']
  end

  def get_todos
    get todos_path
  end

  def get_todo(id)
    get todo_path(id)
  end

  def todos_url_for(id)
    "#{ENV.fetch('HOST_URL')}/#{id}"
  end
end
