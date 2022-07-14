# frozen_string_literal: true

class TodoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :url, :order, :completed

  def url
    "#{todos_url}/#{object.id}"
  end
end
