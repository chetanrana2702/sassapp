# frozen_string_literal: true

# Migration class to create manage_subscription_months table
class CreateManageSubscriptionMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :manage_subscription_months do |t|
      t.references :subscription, foreign_key: true, null: false
      t.json :plan_name_translations, null: false, default: '{}'
      t.integer :month_number, null: false, default: '0', limit: 1
      t.integer :total_months, null: false, default: '0', limit: 1
      t.decimal :actual_plan_price, precision: 6, scale: 2, null: false, default: '0'
      t.integer :coupon_code, null: false, default: '0', limit: 2
      t.integer :discount_in_percnt, null: true, limit: 1
      t.decimal :discount_fixed_amount, precision: 6, scale: 2, null: true, default: '0'
      t.decimal :discounted_price, precision: 6, scale: 2, null: false, default: '0'
      t.decimal :total_price, precision: 6, scale: 2, null: false, default: '0'
      t.timestamp :starts_on, null: false
      t.timestamp :ends_on, null: false
      t.boolean :order_generated, null: false, default: '0'
      t.boolean :full_payment_received, null: false, default: '0'

      t.timestamps
    end
  end
end
