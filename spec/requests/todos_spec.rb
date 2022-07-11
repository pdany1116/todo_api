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

  describe 'POST /todos' do
    subject(:post_todo) { post '/todos', params: }

    let(:params) do
      {
        title:,
        order:
      }
    end

    context 'with valid params' do
      let(:title) { Faker::Beer.brand }
      let(:order) { 1 }

      it 'returns 201' do
        post_todo

        expect(response).to have_http_status(:created)
      end

      it 'responds with the created todo' do
        post_todo

        expect(parsed_body).to match(hash_including({
                                                      title:,
                                                      url: "/todos/#{Todo.last.id}",
                                                      completed: false,
                                                      order:
                                                    }))
      end
    end

    context 'with missing title' do
      let(:params) do
        {
          order:
        }
      end
      let(:order) { 1 }

      it 'returns 422' do
        post_todo

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with invalid title' do
      let(:title) { nil }
      let(:order) { 1 }

      it 'returns 422' do
        post_todo

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with missing order' do
      let(:params) do
        {
          title:
        }
      end
      let(:title) { Faker::Beer.brand }

      it 'returns 201' do
        post_todo

        expect(response).to have_http_status(:created)
      end

      it 'responds with the created todo' do
        post_todo

        expect(parsed_body).to match(hash_including({
                                                      title:,
                                                      url: "/todos/#{Todo.last.id}",
                                                      completed: false,
                                                      order: 1
                                                    }))
      end
    end

    context 'with invalid order' do
      let(:title) { Faker::Beer.brand }
      let(:order) { nil }

      it 'returns 201' do
        post_todo

        expect(response).to have_http_status(:created)
      end

      it 'responds with the created todo' do
        post_todo

        expect(parsed_body).to match(hash_including({
                                                      title:,
                                                      url: "/todos/#{Todo.last.id}",
                                                      completed: false,
                                                      order: 1
                                                    }))
      end
    end
  end
end
