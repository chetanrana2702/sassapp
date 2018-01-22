# frozen_string_literal: true

# Migration to create category table
class CreateCategories < ActiveRecord::Migration[5.1]
  # def change
  #   create_table :categories do |t|
  #     t.text :name_translations, null: false, default: '{}'
  #     t.boolean :status, default: '0'
  #     t.timestamp
  #   end
  # end
  def up
    execute <<-SQL
      CREATE TABLE categories(
        id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name_translations JSON,
        status TINYINT(2) NOT NULL,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL
        CHECK (name_translations IS NULL OR JSON_VALID(name_translations))
      );
    SQL
  end

  def down
    drop_table :categories
  end
end
