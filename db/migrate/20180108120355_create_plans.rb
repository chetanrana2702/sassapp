# frozen_string_literal: true

# Migration class to create plans table
class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.json :title_translations, null: false, default: '{}'
      t.json :description_translations, null: false, default: '{}'
      t.decimal :price, null: false, precision: 6, scale: 2, default: '0'
      t.boolean :status, null: false, default: '0'

      t.timestamps
    end
  end
end
