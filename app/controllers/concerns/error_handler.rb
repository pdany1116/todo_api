# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
  end

  def record_invalid(exception)
    errors = exception.record.errors.map do |error|
      error_message(error.full_message, nil, Rack::Utils.status_code(:unprocessable_entity))
    end

    render json: { errors: }, status: :unprocessable_entity
  end

  def record_not_found(exception)
    error = error_message(exception.message, nil, Rack::Utils.status_code(:not_found))

    render json: { errors: [error] }, status: :not_found
  end

  def parameter_missing(exception)
    error = error_message(exception.message, nil, Rack::Utils.status_code(:unprocessable_entity))

    render json: { errors: [error] }, status: :unprocessable_entity
  end

  def error_message(title, detail, status)
    { title:, detail:, status: }
  end
end
