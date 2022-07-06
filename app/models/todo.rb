# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :title, :url, :order, presence: true
  validates :completed, inclusion: { in: [true, false] }
end
