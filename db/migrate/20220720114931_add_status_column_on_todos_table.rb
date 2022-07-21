# frozen_string_literal: true

class AddStatusColumnOnTodosTable < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :status, :integer, default: 0
  end
end
