# frozen_string_literal: true

# Migration class to create discounts table
class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.references :plan, index: true, foreign_key: true, null: false
      t.json :name_translations, null: false, default: '{}'
      t.integer :coupon_code, null: false, default: '0', limit: 2
      t.integer :in_percentage, null: true, default: 'NULL'
      t.decimal :in_price, null: true, precision: 6, scale: 2, default: '0'
      t.boolean :status, null: false, default: '0'

      t.timestamps
    end
  end
end
