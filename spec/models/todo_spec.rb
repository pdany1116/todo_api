# frozen_string_literal: true

require 'rails_helper'
require 'uri'
require 'faker'

RSpec.describe Todo, type: :model do
  describe 'Validations' do
    let(:create_todo) { Todo.create(title:, completed:, url:, order:) }
    let(:title) { Faker::Beer.brand }
    let(:completed) { false }
    let(:url) { Faker::Internet.url }
    let(:order) { 1 }

    context 'with valid parameters' do
      it 'is valid' do
        todo = create_todo

        expect(todo).to be_valid
      end
    end

    context 'with invalid parameters' do
      context 'with invalid title' do
        let(:title) { nil }

        it 'is invalid' do
          todo = create_todo

          expect(todo).not_to be_valid
        end
      end

      context 'with invalid completed' do
        let(:completed) { nil }

        it 'is invalid' do
          todo = create_todo

          expect(todo).not_to be_valid
        end
      end

      context 'with invalid url' do
        let(:url) { nil }

        it 'is invalid' do
          todo = create_todo

          expect(todo).not_to be_valid
        end
      end

      context 'with invalid order' do
        let(:order) { nil }

        it 'is invalid' do
          todo = create_todo

          expect(todo).not_to be_valid
        end
      end
    end
  end
end
