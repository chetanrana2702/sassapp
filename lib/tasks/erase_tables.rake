# frozen_string_literal: true

# Rake task to remove tables from common database
# Rake task will run only once when we are deploying code to server
namespace :database do
  desc 'Erase all tables'
  task erase_tables: :environment do
    conn = ActiveRecord::Base.connection
    tables = conn.tables
    tables.each do |table|
      unless %w(ar_internal_metadata tenants schema_migrations).include? table
        puts "Deleting #{table}"
        conn.drop_table(table)
      end
    end
  end
end
