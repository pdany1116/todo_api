# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :title, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :order, numericality: true

  attribute :completed, :boolean, default: false
  attribute :order, :integer, default: 0
end
