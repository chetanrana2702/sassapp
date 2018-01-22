# frozen_string_literal: true

# [..]
module Tenants
  # [..]
  module Methods
    extend ActiveSupport::Concern

    private

    # Methods
    def set_db_uuid_of_tenant
      self.db_uuid = SecureRandom.hex(4)
    end

    def create_tenant
      Apartment::Tenant.create(db_uuid)
    end

    def create_spree_user
      Apartment::Tenant.switch!(db_uuid)
      attributes = {
        password: 'password',
        password_confirmation: 'password',
        email: email,
        login: email
      }
      admin = Spree::User.new(attributes)
      if admin.save
        role = Spree::Role.find_or_create_by(name: 'admin')
        admin.spree_roles << role
        admin.save
        admin.generate_spree_api_key! if Spree::Auth::Engine.api_available?
        print 'Done!'
      end
    end
  end
end
