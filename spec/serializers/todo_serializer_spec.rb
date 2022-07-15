# frozen_string_literal: true

include Rails.application.routes.url_helpers

RSpec.describe TodoSerializer do
  subject { described_class.new(todo) }

  let(:todo) { create(:todo) }

  it 'serializes the correct attributes' do
    expect(subject.attributes.keys).to contain_exactly(:id, :title, :url, :order, :completed)
  end

  it 'has the correct id' do
    expect(subject.attributes[:id]).to eq todo.id
  end

  it 'has the correct title' do
    expect(subject.attributes[:title]).to eq todo.title
  end

  it 'has the correct order' do
    expect(subject.attributes[:order]).to eq todo.order
  end

  it 'has the correct completed' do
    expect(subject.attributes[:completed]).to eq todo.completed
  end

  it 'has the correct url' do
    expect(subject.attributes[:url]).to eq "#{ENV.fetch('HOST_URL')}#{todos_path}/#{todo.id}"
  end
end
