# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    todos = Todo.all

    render json: todos, status: :ok
  end

  def create
    todo = Todo.create! do |t|
      t.title = permitted_params[:title]
      t.order = permitted_params[:order] || 1
      t.completed = false
    end
    todo.url = "/todos/#{todo.id}"
    todo.save!

    render json: todo, status: :created
  rescue ActionController::ParameterMissing, ActiveRecord::RecordInvalid => e
    render json: e.message, status: :unprocessable_entity
  end

  private

  def permitted_params
    params.require(:title)

    params.permit(:title, :order)
  end
end
