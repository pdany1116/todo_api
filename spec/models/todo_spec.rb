# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'Validations' do
    context 'with valid parameters' do
      subject { build(:todo) }

      it { is_expected.to be_valid }
    end

    context 'with invalid title' do
      subject { build(:todo, title: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'with invalid completed' do
      subject { build(:todo, completed: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'with invalid order' do
      subject { build(:todo, order: nil) }

      it { is_expected.not_to be_valid }
    end
  end
end
