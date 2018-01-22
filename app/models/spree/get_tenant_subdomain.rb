module Spree
  class GetTenantSubdomain

    # this class is written to fetch tenant subdomain to make folders in cloudinary as we are setting folder name as tenant's subdomain
    def self.get_subdomain
      tenant = Apartment::Tenant.current
      current_tenant = Tenant.find_by_db_uuid(tenant)
      return current_tenant.subdomain
    end

    def self.get_environment
      return ENV["RACK_ENV"]
    end
  end
end
