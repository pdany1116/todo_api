# frozen_string_literal: true

class TodosController < ApplicationController
  include ErrorHandler

  def index
    todos = Todo.all

    render json: todos, status: :ok, each_serializer: TodoSerializer
  end

  def show
    todo = Todo.find(params[:id])

    render json: todo, status: :ok, serializer: TodoSerializer
  end

  def create
    todo = Todo.create!(create_todo_params)

    render json: todo, status: :created, serializer: TodoSerializer
  end

  def destroy
    Todo.find(params[:id]).destroy

    render json: '', status: :no_content
  end

  def delete_all
    Todo.delete_all

    render json: '', status: :no_content
  end

  def update
    todo = Todo.find(params[:id])
    todo.update!(update_todo_params)

    render json: todo, status: :ok, serializer: TodoSerializer
  end

  private

  def create_todo_params
    params.require(:title)

    params.permit(:title, :order)
  end

  def update_todo_params
    params.permit(:title, :order, :completed)
  end
end
