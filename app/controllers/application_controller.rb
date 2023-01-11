class ApplicationController < ActionController::API
    rescue_from ActionController::RoutingError, with: :route_not_found
    rescue_from StandardError, with: :handle_standard_error

  private

    def route_not_found
        render json: { error: 'route not found' }, status: 404
    end

    def handle_standard_error
      render json: { error: 'Server error' }, status: 500
    end
end
