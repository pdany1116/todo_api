# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'GET /todos' do
    subject(:get_todos) { get '/todos' }

    context 'with no todos added' do
      let(:empty_array) { [] }

      before { get_todos }

      it { expect(response).to have_http_status(:ok) }

      it { expect(parsed_body).to eq empty_array }
    end

    context 'with 1 todo added' do
      before do
        create(:todo)

        get_todos
      end

      it { expect(response).to have_http_status(:ok) }

      it { expect(parsed_body.length).to be 1 }

      it 'has correct attributes' do
        expect(parsed_body[0]).to match(hash_including({
                                                         id: Todo.last.id,
                                                         title: Todo.last.title,
                                                         url: Todo.last.url,
                                                         completed: Todo.last.completed,
                                                         order: Todo.last.order
                                                       }))
      end
    end

    context 'with 5 todos added' do
      before do
        create_list(:todo, 5)

        get_todos
      end

      it { expect(response).to have_http_status(:ok) }

      it { expect(parsed_body.length).to be 5 }
    end
  end
end
