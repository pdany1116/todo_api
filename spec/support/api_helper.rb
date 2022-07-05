# frozen_string_literal: true

require 'rails_helper'

module ApiHelper
  def parsed_body
    JSON.parse(response.body)
  end
end
