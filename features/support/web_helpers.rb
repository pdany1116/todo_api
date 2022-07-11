# frozen_string_literal: true

module WebHelpers
  def parsed_body
    JSON.parse(last_response.body)
  end
end
