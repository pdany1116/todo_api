# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'Validations' do
    context 'with valid parameters' do
      subject(:todo) { build(:todo) }

      it { is_expected.to be_valid }
    end

    context 'with invalid title' do
      subject(:todo) { build(:todo, title: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'with invalid completed' do
      subject(:todo) { build(:todo, completed: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'with invalid url' do
      subject(:todo) { build(:todo, url: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'with invalid order' do
      subject(:todo) { build(:todo, order: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
