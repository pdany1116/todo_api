# frozen_string_literal: true

class SetDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :todos, :completed, from: nil, to: false
    change_column_default :todos, :order, from: nil, to: 0
  end
end
