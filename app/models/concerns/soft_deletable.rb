# frozen_string_literal: true

module SoftDeletable
  extend ActiveSupport::Concern

  included do
    default_scope { where(status: 'active') }
  end

  def delete
    deleted!
  end
end
