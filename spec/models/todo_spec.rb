# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'Validations' do
    context 'with valid parameters' do
      it 'is valid' do
        todo = build(:todo)

        expect(todo).to be_valid
      end
    end

    context 'with invalid parameters' do
      context 'with invalid title' do
        it 'is invalid' do
          todo = build(:todo, title: nil)

          expect(todo).not_to be_valid
        end
      end

      context 'with invalid completed' do
        it 'is invalid' do
          todo = build(:todo, completed: nil)

          expect(todo).not_to be_valid
        end
      end

      context 'with invalid url' do
        it 'is invalid' do
          todo = build(:todo, url: nil)

          expect(todo).not_to be_valid
        end
      end

      context 'with invalid order' do
        it 'is invalid' do
          todo = build(:todo, order: nil)

          expect(todo).not_to be_valid
        end
      end
    end
  end
end
