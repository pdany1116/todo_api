# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    title { 'Example title' }
    completed { false }
    url { 'Example url' }
    order { 1 }
  end
end
