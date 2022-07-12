# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    todos = Todo.all

    render json: todos, status: :ok
  end

  def create
    todo = Todo.create!(permitted_params)
    todo.url = "/todos/#{todo.id}"
    todo.save!

    render json: todo, status: :created
  rescue ActionController::ParameterMissing, ActiveRecord::RecordInvalid
    render json: '', status: :unprocessable_entity
  end

  private

  def permitted_params
    params.require(:title)

    params.permit(:title, :order)
  end
end
