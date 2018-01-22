# frozen_string_literal: true
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


require 'rails_helper'

RSpec.describe Tenant, type: :model do

  describe 'associations' do
    it { should have_one :subscription }
    it { should belong_to :category }
  end

  describe 'validations' do
    it {is_expected.to validate_presence_of :firstname}
    it {is_expected.to validate_presence_of :lastname}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_presence_of :subdomain}
    it {is_expected.to validate_presence_of :phone_number}
    it {is_expected.to validate_presence_of :password}
    it {is_expected.to validate_presence_of :password_confirmation}
  end

  describe 'callbacks' do
    let!(:tenant) { build(:tenant) }
    context 'set db_uuid' do
      it 'should not have db_uuid' do
        expect(tenant.db_uuid).to be_nil
      end

      it 'should have db_uuid' do
        tenant.save
        expect(tenant.db_uuid).not_to be_empty
      end
    end
    context 'create spree user from tenant' do
      it 'should save spree user from tenant' do
        spree_user = Spree::User.find_or_create_by(email: tenant.email)
        expect(tenant.email).to eq(spree_user.email)
      end
    end
  end
end
