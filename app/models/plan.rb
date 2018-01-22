# frozen_string_literal: true

# Model Class Plan
# == Schema Information
#
# Table name: plans
#
#  id                       :integer          not null, primary key
#  title_translations       :text(65535)      default("'\"{}\"'"), not null
#  description_translations :text(65535)      default("'\"{}\"'"), not null
#  price                    :decimal(6, 2)    default(0.0), not null
#  status                   :boolean          default(FALSE), not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Plan < ApplicationRecord
  translates :title, :description
  # Associations
  has_many :subscriptions
  has_many :discounts
  # validations
  validates_presence_of :title_translations,
                        :description_translations,
                        :price,
                        :status
end
