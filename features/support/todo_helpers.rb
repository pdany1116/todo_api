# frozen_string_literal: true

module TodoHelpers
  include FactoryBot::Syntax::Methods

  def create_todo
    create(:todo)
    @last_todo_id = Todo.last.id
  end

  def get_todos
    get '/todos'
  end

  def get_todo(id)
    get "/todos/#{id}"
  end
end
