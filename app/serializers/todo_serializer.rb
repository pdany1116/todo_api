# frozen_string_literal: true

class TodoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :url, :order, :completed

  def url
    Iri.new(ENV.fetch('HOST_URL')).path(todo_path(object)).to_s
  end
end
