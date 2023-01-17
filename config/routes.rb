# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'
  resources :todos, only: %i[index show create destroy update]

  delete :todos, to: 'todos#delete_all'
end
