# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SoftDeletable do
  describe 'default scope' do
    context 'with 1 active and 1 deleted todos' do
      before do
        create(:todo)
        create(:todo, status: :deleted)
      end

      it 'has 1 todo' do
        expect(Todo.all.count).to eq 1
      end
    end
  end

  describe '#delete' do
    it 'changes status to deleted' do
      todo = create(:todo)

      expect { todo.delete }.to change(todo, :status).from('active').to('deleted')
    end

    it 'does not delete database rows' do
      todo = create(:todo)

      expect { todo.delete }.not_to change(Todo.unscoped.all, :count)
    end
  end
end
