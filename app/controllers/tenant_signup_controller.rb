# frozen_string_literal: true

# Controller Class TenantSignup
# @reposibility - To signup new tenant
class TenantSignupController < ApplicationController
  # This controller class is using other.html.erb layout
  # instead of application or home.html.erb layouts
  # to keep the css and javascript file specific to layout of page
  # as they differ in design.
  layout 'other'
  include CategoryHelper

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      redirect_to 'http://' + @tenant.subdomain + '.' +
                  request.host + ':' +
                  request.port.to_s + '/admin/login'
    else
      render 'new'
    end
  end

  private

  def tenant_params
    params.require(:tenant)
          .permit(:email, :password, :password_confirmation, :subdomain, :category_id)
  end
end
