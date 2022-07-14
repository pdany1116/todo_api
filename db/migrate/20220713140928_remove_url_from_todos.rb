# frozen_string_literal: true

class RemoveUrlFromTodos < ActiveRecord::Migration[7.0]
  def change
    remove_column :todos, :url, :string
  end
end
