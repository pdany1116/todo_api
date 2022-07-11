# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :title, :order, presence: true
  validates :completed, inclusion: { in: [true, false] }

  def initialize(attributes)
    super
    self.completed = false unless completed
  end
end
