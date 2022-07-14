# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    todos = Todo.all

    render json: todos, status: :ok
  end

  def show
    todo = Todo.find(params[:id])

    render json: todo, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: '', status: :not_found
  end

  def create
    todo = Todo.create!(create_todo_params)

    render json: todo, status: :created
  rescue ActionController::ParameterMissing, ActiveRecord::RecordInvalid
    render json: '', status: :unprocessable_entity
  end

  private

  def create_todo_params
    params.require(:title)

    params.permit(:title, :order)
  end
end
