class ApplicationController < ActionController::API
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

   def record_not_found(err)
      render json: { error: err.message }, status: :not_found
   end

   def invalid_record(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
   end
end
