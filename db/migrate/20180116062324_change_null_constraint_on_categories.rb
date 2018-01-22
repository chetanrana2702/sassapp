# frozen_string_literal: true

# Migration to update null constraint in categories table
class ChangeNullConstraintOnCategories < ActiveRecord::Migration[5.1]
  def change
    change_column_null :categories, :name_translations, false
    change_column :categories, :status, :boolean, default: false
  end
end
