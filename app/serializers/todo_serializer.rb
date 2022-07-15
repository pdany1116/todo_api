# frozen_string_literal: true

class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :order, :completed

  def url
    "#{ENV.fetch('HOST_URL')}/#{object.id}"
  end
end
