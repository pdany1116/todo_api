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
    Todo.delete(params[:id])

    render json: '', status: :no_content
  end

  private

  def create_todo_params
    params.require(:title)

    params.permit(:title, :order)
  end
end
