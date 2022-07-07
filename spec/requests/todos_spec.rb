# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'GET /todos' do
    subject(:get_todos) { get '/todos' }

    context 'with no todos added' do
      it 'responds with 200' do
        get_todos

        expect(response).to have_http_status(:ok)
      end

      it 'responds with empty array' do
        get_todos

        expect(parsed_body).to eq []
      end
    end

    context 'with 1 todo added' do
      before do
        create(:todo)
      end

      it 'responds with 200' do
        get_todos

        expect(response).to have_http_status(:ok)
      end

      it 'responds with array of size 1' do
        get_todos

        expect(parsed_body.length).to be 1
      end

      it 'contains the correct title field' do
        get_todos

        expect(parsed_body[0][:title]).to eq Todo.last.title
      end

      it 'contains the correct completed field' do
        get_todos

        expect(parsed_body[0][:completed]).to be Todo.last.completed
      end

      it 'contains the correct url field' do
        get_todos

        expect(parsed_body[0][:url]).to eq Todo.last.url
      end

      it 'contains the correct order field' do
        get_todos

        expect(parsed_body[0][:order]).to be Todo.last.order
      end
    end

    context 'with 5 todos added' do
      before do
        create_list(:todo, 5)
      end

      it 'responds with 200' do
        get_todos

        expect(response).to have_http_status(:ok)
      end

      it 'responds with array of size 5' do
        get_todos

        expect(parsed_body.length).to be 5
      end
    end
  end
end
