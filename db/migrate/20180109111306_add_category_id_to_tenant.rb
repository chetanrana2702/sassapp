# frozen_string_literal: true

# Migration to add category_id foreign key to tenants table
class AddCategoryIdToTenant < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :category_id, :integer
  end
end
