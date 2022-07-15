# frozen_string_literal: true

require './lib/json_helpers'
require 'rails_helper'

RSpec.describe JsonHelpers::Formatter do
  describe '#format_content' do
    subject do
      described_class.new(SPEC_DIR.join('lib/json_helpers/formatter_example.json'))
                     .format_content(args)
    end

    let(:args) { { value1: 42, value2: 'test' } }

    it 'returns formatted content' do
      hash = JSON.parse(subject, symbolize_names: true)

      expect(hash).to eq({ int_key: 42, string_key: 'test' })
    end
  end
end
