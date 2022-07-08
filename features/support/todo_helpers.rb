# frozen_string_literal: true

module TodoHelpers
  include FactoryBot::Syntax::Methods

  def create_todo
    create(:todo)
  end

  def get_todos
    get '/todos'
  end
end
