# frozen_string_literal: true

# This Controller Class would be responsible for overriding
# Spree Admin User Create and Destroy Login properly
# By doing so we fixed two issue:
# 1. When Admin login in he must be redirected to admin dashboard page.
# 2. When Admin logout he should be redirected to admin login page.
# @override
module Spree
  module Admin
    # Controller Class UserSessions
    class UserSessionsController < Devise::SessionsController
      helper 'spree/base'

      include Spree::Core::ControllerHelpers::Auth
      include Spree::Core::ControllerHelpers::Common
      include Spree::Core::ControllerHelpers::Store

      helper 'spree/admin/navigation'
      layout :resolve_layout

      def new
        super
      end

      # Override Spree Admin User Session
      def create
        authenticate_spree_user!
        if spree_user_signed_in?
          redirect_to admin_orders_path
        else
          flash.now[:error] = t('devise.failure.invalid')
          render :new
        end
      end

      def destroy
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))

        set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
        redirect_to admin_create_new_session_path
      end

      private

      def redirect_back_or_default(default)
        redirect_to(session['spree_user_return_to'] || default)
        session['spree_user_return_to'] = nil
      end

      def resolve_layout
        case action_name
        when 'new', 'create'
          'spree/layouts/login'
        else
          'spree/layouts/admin'
        end
      end
    end
  end
end
