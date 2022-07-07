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

      it 'has correct title attribute' do
        expect(parsed_body[0][:title]).to eq Todo.last.title
      end

      it 'has correct completed attribute' do
        expect(parsed_body[0][:completed]).to eq Todo.last.completed
      end

      it 'has correct title attribute' do
        expect(parsed_body[0][:url]).to eq Todo.last.url
      end

      it 'has correct title attribute' do
        expect(parsed_body[0][:order]).to eq Todo.last.order
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
