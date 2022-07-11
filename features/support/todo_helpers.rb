# frozen_string_literal: true

module TodoHelpers
  include FactoryBot::Syntax::Methods

  def create_todo
    create(:todo)
  end

  def get_todos
    get '/todos'
  end

  def get_todo(id)
    get "/todos/#{id}"
  end

  def post_todo
    post '/todos', attributes_for(:todo).slice(:title, :order)
    @last_todo_id = parsed_body[:id]
  end
end
