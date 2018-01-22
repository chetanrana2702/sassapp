# frozen_string_literal: true

# Migration to create admins table.
# @responsibility: This table will hold Main admin
# and subadmins details.
class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, null: false
      t.string :password_digest, null: false
      t.text :address
      t.integer :client_type
      t.string :from_ip

      t.timestamps
    end
  end
end
