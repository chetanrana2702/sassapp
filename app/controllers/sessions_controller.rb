# frozen_string_literal: true

# Controller Class Sessions
# @reposibility - To signin main admin
# then he would be redirected to his dashboard from
# where he would manage all tenants.
class SessionsController < ApplicationController
  # This controller class is using other.html.erb layout
  # instead of application or home.html.erb layouts
  # to keep the css and javascript file specific to layout of page
  # as they differ in design.
  layout 'other'
  before_action :verify_admin, only: :create

  # []
  def create
    # Here Main admin will login
    if @auth_token
      redirect_to mainauthority_dashboard_index_url
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # []
  def destroy
    # Code to destroy admin session
  end

  private

  def verify_admin
    @auth_token = AuthenticateUser.new(
      params[:sessions][:email].downcase,
      params[:sessions][:password]
    ).call
  end
end
