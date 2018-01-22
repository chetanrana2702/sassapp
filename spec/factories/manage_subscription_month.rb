# frozen_string_literal: true

# Factory Model
FactoryBot.define do
  factory :manage_subscription_month do
    plan_name_translations  { Faker::Lorem.characters }
    month_number            { Faker::Number.digit }
    total_months            { Faker::Number.digit }
    actual_plan_price       { Faker::Number.decimal(2) }
    coupon_code             { Faker::Number.digit }
    discount_in_percnt      { Faker::Number.digit }
    discount_fixed_amount   { Faker::Number.decimal(2) }
    discounted_price        { Faker::Number.decimal(2) }
    total_price             { Faker::Number.decimal(2) }
    starts_on               { Faker::Date.backward(14) }
    ends_on                 { Faker::Date.forward(23) }
    order_generated         { Faker::Boolean.boolean }
    full_payment_received   { Faker::Boolean.boolean }
  end
end
