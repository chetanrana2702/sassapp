# frozen_string_literal: true

# Model Class: Category
# == Schema Information
#
# Table name: categories
#
#  id                :integer          not null, primary key
#  name_translations :text(65535)      not null
#  status            :boolean          default(FALSE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Category < ApplicationRecord
  translates :name

  # Associations
  has_many :tenants, inverse_of: :category
end
