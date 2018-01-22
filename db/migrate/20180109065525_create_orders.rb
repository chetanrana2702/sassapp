# frozen_string_literal: true

# Migration class to create orders table
class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :manage_subscription_month, foreign_key: true, null: false
      t.decimal :total_price, precision: 6, scale: 2, null: false, default: '0'
      t.boolean :payment_status, null: false, default: '0'
      t.boolean :payment_mode, null: false, default: '0'
      t.integer :transaction_unique_id, null: false, default: '0', limit: 8

      t.timestamps
    end
  end
end
