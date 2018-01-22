# frozen_string_literal: true

# Migration class to create subscriptions table
class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :tenant, index: true, foreign_key: true, null: false
      t.references :plan, index: true, foreign_key: true, null: false
      t.timestamp :starts_on, null: false
      t.timestamp :ends_on, null: false
      t.boolean :is_active, null: false, default: '0'

      t.timestamps
    end
  end
end
