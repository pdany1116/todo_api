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
end
