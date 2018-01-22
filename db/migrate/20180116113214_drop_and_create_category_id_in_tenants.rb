# frozen_string_literal: true

# Migration to drop and create category_id column
class DropAndCreateCategoryIdInTenants < ActiveRecord::Migration[5.1]
  def up
    remove_column :tenants, :category_id
    add_reference :tenants,
                  :category,
                  index: true,
                  null: false, default: 1
    change_column :tenants, :password_digest, :string, null: false, default: ''
  end

  def down
    remove_reference :tenants, :category
    add_column :tenants, :category_id, :integer
    change_column :tenants, :password_digest, :string, null: true, default: ''
  end
end
