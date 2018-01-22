# frozen_string_literal: true

# @override
# This class is written to fetch tenant subdomain so
# that it can be passed as folder name in cloudinary
# so we can easily know who's folder are those.
module Spree
  # Model Class: GetTenantSubdomain
  class GetTenantSubdomain
    def self.subdomain
      tenant = Apartment::Tenant.current
      current_tenant = Tenant.find_by_db_uuid(tenant)
      current_tenant.subdomain
    end

    def self.environment
      ENV['RACK_ENV']
    end
  end
end
