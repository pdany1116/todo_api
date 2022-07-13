# frozen_string_literal: true

RSpec.describe TodoSerializer do
  subject { described_class.new(build(:todo)) }

  it 'serializes the correct attributes' do
    expect(subject.attributes.keys).to contain_exactly(:id, :title, :url, :order, :completed)
  end
end
