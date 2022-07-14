# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    title { Faker::Beer.brand }
    completed { false }
    order { 1 }
  end
end
