# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe '#index' do
    subject { get :index }

    context 'with no todos added' do
      it 'returns 200' do
        subject

        expect(response).to have_http_status(:ok)
      end

      it 'returns empty array' do
        subject

        expect(parsed_body).to eq []
      end
    end

    context 'with 5 todos added' do
      before { create_list(:todo, 5) }

      it 'returns 200' do
        subject

        expect(response).to have_http_status(:ok)
      end

      it 'returns array with 5 todos' do
        subject

        expect(parsed_body.length).to be 5
      end
    end
  end

  describe '#show' do
    subject { get :show, params: }

    let(:params) { { id: 1 } }

    context 'with not existing todo' do
      it 'returns 404' do
        subject

        expect(response).to have_http_status(:not_found)
      end

      it 'returns empty body' do
        subject

        expect(response.body).to be_empty
      end
    end

    context 'with existing todo' do
      before { create(:todo, id: params[:id]) }

      it 'returns 200' do
        subject

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#create' do
    subject { post :create, params: }

    let(:params) { { title:, order: } }

    context 'with valid params' do
      let(:title) { Faker::Beer.brand }
      let(:order) { 1 }

      it 'returns 201' do
        subject

        expect(response).to have_http_status(:created)
      end
    end

    context 'with missing title' do
      let(:params) { { order: 1 } }

      it 'returns 422' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with invalid title' do
      let(:title) { nil }
      let(:order) { 1 }

      it 'returns 422' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with missing order' do
      let(:params) { { title: } }
      let(:title) { Faker::Beer.brand }

      it 'returns 201' do
        subject

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid order' do
      let(:title) { Faker::Beer.brand }
      let(:order) { nil }

      it 'returns 422' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: }

    let(:params) { { id: 1 } }

    context 'with not existing todo' do
      it 'returns 404' do
        subject

        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with existing todo' do
      before { create(:todo, id: params[:id]) }

      it 'returns 204' do
        subject

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
