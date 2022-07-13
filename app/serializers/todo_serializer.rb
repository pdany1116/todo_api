# frozen_string_literal: true

class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :order, :completed
end
