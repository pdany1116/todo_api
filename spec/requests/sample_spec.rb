# frozen_literal_string: true

require 'rails_helper'

RSpec.describe 'Sample test' do
  describe 'Add 1 with itself' do
    it 'equals 2' do
      expect(1 + 1).to eq 2
    end
  end
end
