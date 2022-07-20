# frozen_string_literal: true

ActiveRecord::Schema[7.0].define(version: 2022_07_13_140928) do
  enable_extension 'plpgsql'

  create_table 'todos', force: :cascade do |t|
    t.string 'title'
    t.boolean 'completed', default: false
    t.integer 'order', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
