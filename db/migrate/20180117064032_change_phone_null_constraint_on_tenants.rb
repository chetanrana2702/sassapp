# frozen_string_literal: true

# Migration class to alter phone column constraint in tenants table
class ChangePhoneNullConstraintOnTenants < ActiveRecord::Migration[5.1]
  def up
    change_column :tenants, :phone, :string, null: true
  end

  def down
    change_column :tenants, :phone, :string, null: false
  end
end
