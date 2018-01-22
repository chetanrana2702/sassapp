# frozen_string_literal: true

# Controller Class: Errors
class ErrorsController < ApplicationController
  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end
end
