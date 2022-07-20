# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    todos = Todo.all

    render json: todos, status: :ok, each_serializer: TodoSerializer
  end

  def show
    todo = Todo.find(params[:id])

    render json: todo, status: :ok, serializer: TodoSerializer
  rescue ActiveRecord::RecordNotFound
    render json: '', status: :not_found
  end

  def create
    todo = Todo.create!(create_todo_params)

    render json: todo, status: :created, serializer: TodoSerializer
  rescue ActionController::ParameterMissing, ActiveRecord::RecordInvalid
    render json: '', status: :unprocessable_entity
  end

  def destroy
    Todo.find(params[:id]).destroy

    render json: '', status: :no_content
  rescue ActiveRecord::RecordNotFound
    render json: '', status: :not_found
  end

  def delete_all
    Todo.delete_all

    render json: '', status: :no_content
  end

  def update
    todo = Todo.find(params[:id])
    todo.update!(update_todo_params)

    render json: todo, status: :ok, serializer: TodoSerializer
  rescue ActionController::ParameterMissing, ActiveRecord::RecordInvalid
    render json: '', status: :unprocessable_entity
  rescue ActiveRecord::RecordNotFound
    render json: '', status: :not_found
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
