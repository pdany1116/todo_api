# frozen_string_literal: true

class TodosController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_handler
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_handler
  rescue_from ActionController::ParameterMissing, with: :parameter_missing_handler

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

  def record_invalid_handler(exception)
    errors = exception.record.errors.map do |error|
      error_message(error.full_message, nil, Rack::Utils.status_code(:unprocessable_entity))
    end

    render json: { errors: }, status: :unprocessable_entity
  end

  def record_not_found_handler(exception)
    error = error_message(exception.message, nil, Rack::Utils.status_code(:not_found))

    render json: { errors: [error] }, status: :not_found
  end

  def parameter_missing_handler(exception)
    error = error_message(exception.message, nil, Rack::Utils.status_code(:unprocessable_entity))

    render json: { errors: [error] }, status: :unprocessable_entity
  end

  def error_message(title, detail, status)
    { title:, detail:, status: }
  end
end
