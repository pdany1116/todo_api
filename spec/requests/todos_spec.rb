# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'GET /todos' do
    subject(:get_todos) { get '/todos' }

    context 'with no todos added' do
      it 'returns 200' do
        get_todos

        expect(response).to have_http_status(:ok)
      end

      it 'returns empty array' do
        get_todos

        expect(parsed_body).to eq []
      end
    end

    context 'with 5 todos added' do
      before { create_list(:todo, 5) }

      it 'returns 200' do
        get_todos

        expect(response).to have_http_status(:ok)
      end

      it 'returns array with 5 todos' do
        get_todos

        expect(parsed_body.length).to be 5
      end
    end
  end

  describe 'GET /todos/:id' do
    subject(:get_todo) { get "/todos/#{id}" }
    let(:id) { 1 }

    context 'with not existing todo' do
      it 'returns 404' do
        get_todo

        expect(response).to have_http_status(:not_found)
      end

      it 'returns empty body' do
        get_todo

        expect(response.body).to be_empty
      end
    end

    context 'with existing todo' do
      before { create(:todo, id:) }

      it 'returns 200' do
        get_todo

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
