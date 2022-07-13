# frozen_string_literal: true

module TodoHelpers
  include FactoryBot::Syntax::Methods

  def create_todo
    post todos_path, attributes_for(:todo).slice(:title)
    @last_todo_id = parsed_body['id']
  end

  def get_todos
    get todos_path
  end

  def get_todo(id)
    get todo_path(id)
  end
end
