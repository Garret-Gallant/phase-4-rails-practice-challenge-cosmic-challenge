class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :invalid_response

private

def not_found_response(e)
  render json: { error: "#{e.model} not found" }, status: 404
end

def invalid_response(e)
  render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end

end
