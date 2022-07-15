# frozen_string_literal: true

require './lib/json_helpers'
require 'rails_helper'

RSpec.describe JsonHelpers::Parser do
  describe '#to_hash' do
    subject do
      described_class.new(SPEC_DIR.join('lib/json_helpers/parser_example.json')).to_hash
    end

    it { is_expected.to eq({ key: 'value' }) }
  end
end
