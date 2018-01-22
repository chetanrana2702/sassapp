# frozen_string_literal: true
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


# Factory Model
FactoryBot.define do
  factory :category do
    name_translations  { Faker::Lorem.characters(10) }
    status             { Faker::Number.digit }
  end
end
