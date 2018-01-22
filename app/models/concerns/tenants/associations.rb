# frozen_string_literal: true

#
module Tenants
  # [..]
  module Associations
    extend ActiveSupport::Concern
    included do
      # encrypt password
      has_secure_password
      # Associations
      belongs_to :category
      has_one    :subscription
      # Callbacks
      before_create :set_db_uuid_of_tenant
      before_save { self.email = email.downcase }
      after_create  :create_tenant
      after_create  :create_spree_user
    end
  end
end
