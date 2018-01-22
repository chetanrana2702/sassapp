# frozen_string_literal: true
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


# Factory Model
FactoryBot.define do
  factory :plan do
    title_translations        { Faker::Lorem.characters }
    description_translations  { Faker::Lorem.characters }
    status                    { Faker::Boolean.boolean }
    price                     { Faker::Number.decimal(2) }
  end
end
