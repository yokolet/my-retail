module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Mongoid::Errors::DocumentNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end
  end
end