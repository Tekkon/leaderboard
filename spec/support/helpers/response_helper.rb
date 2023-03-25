# frozen_string_literal: true

module ResponseHelper
  def parsed_response
    return JSON.parse(response.body) unless response.body.empty?

    response.body
  end
end
