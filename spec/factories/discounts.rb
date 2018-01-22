# frozen_string_literal: true
# == Schema Information
#
# Table name: discounts
#
#  id                :integer          not null, primary key
#  plan_id           :integer          not null
#  name_translations :text(65535)      default("'\"{}\"'"), not null
#  coupon_code       :integer          default(0), not null
#  in_percentage     :integer          default(0)
#  in_price          :decimal(6, 2)    default(0.0)
#  status            :boolean          default(FALSE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


# Factory Model
FactoryBot.define do
  factory :discount do
    name_translations  { Faker::Lorem.characters(10) }
    status             { Faker::Number.digit }
    coupon_code        { Faker::Number.digit }
    in_percentage      { Faker::Number.digit }
    in_price           { Faker::Number.decimal(2) }
  end
end
