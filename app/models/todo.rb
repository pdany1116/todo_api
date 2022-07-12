# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :title, :order, presence: true
  validates :completed, inclusion: { in: [true, false] }

  DEFAULT_ORDER = 1

  def initialize(attributes)
    super
    self.completed = false unless completed
    self.order = DEFAULT_ORDER unless order
  end
end
