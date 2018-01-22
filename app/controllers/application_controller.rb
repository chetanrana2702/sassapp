# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError do |exception|
    logger.error "Routing error occurred #{exception.message}"
    render template: 'errors/not_found', status: 404
  end

  rescue_from ActionView::MissingTemplate do |exception|
    logger.error exception.message
    render template: 'errors/not_found', status: 404
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    logger.error exception.message
    render template: 'errors/not_found', status: 404
  end
end
