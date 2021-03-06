# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todos, only: %i[index show create destroy update]

  delete :todos, to: 'todos#delete_all'
end
