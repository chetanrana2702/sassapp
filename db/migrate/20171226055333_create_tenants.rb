# frozen_string_literal: true

# Migration to create tenants table
class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, null: false
      t.string :phone, null: false
      t.string :db_uuid, null: false
      t.string :subdomain, null: false
      t.string :password_digest, null: false
      t.boolean :email_verified, null: false, default: '0'
      t.boolean :phone_verified, null: false, default: '0'
      t.text :address
      t.integer :pincode

      t.timestamps
    end

    add_index :tenants, %i[firstname lastname]
    add_index :tenants, :email
    add_index :tenants, :subdomain
    add_index :tenants, :db_uuid
  end
end
