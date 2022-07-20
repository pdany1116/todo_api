# frozen_string_literal: true

class Todo < ApplicationRecord
  enum status: { active: 0, deleted: 1 }

  validates :title, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :order, numericality: true
  validates :status, inclusion: { in: Todo.statuses.keys }

  attribute :completed, :boolean, default: false
  attribute :order, :integer, default: 0
end
