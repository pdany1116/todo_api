# frozen_string_literal: true

class TodoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :url, :order, :completed

  def url
    URI.parse("#{ENV.fetch('HOST_URL')}#{todos_path}/#{object.id}").to_s
  rescue URI::InvalidURIError
    "#{todos_path}/#{object.id}"
  end
end
