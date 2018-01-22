# frozen_string_literal: true

# Model Class Tenant
# == Schema Information
#
# Table name: ror-prototype_development.tenants
#
#  id              :integer          not null, primary key
#  firstname       :string(255)
#  lastname        :string(255)
#  email           :string(255)      not null
#  password_digest :string(255)      default(""), not null
#  phone           :string(255)      not null
#  db_uuid         :string(255)      not null
#  subdomain       :string(255)      not null
#  email_verified  :boolean          default(FALSE), not null
#  phone_verified  :boolean          default(FALSE), not null
#  address         :text(65535)
#  pincode         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer          default(1), not null
#
class Tenant < ApplicationRecord
  include Tenants::Associations
  include Tenants::Validations
  include Tenants::Methods
end
