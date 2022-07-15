# frozen_string_literal: true

class SetDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_table :todos, bulk: true do |t|
      t.change_default :completed, from: nil, to: false
      t.change_default :order, from: nil, to: 0
    end
  end
end
