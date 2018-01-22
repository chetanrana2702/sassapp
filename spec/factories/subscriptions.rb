# frozen_string_literal: true
# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  tenant_id  :integer          not null
#  plan_id    :integer          not null
#  starts_on  :datetime         not null
#  ends_on    :datetime         default(NULL), not null
#  is_active  :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


# Factory Model
FactoryBot.define do
  factory :subscription do
     starts_on  { Faker::Date.backward(14) }
     ends_on    { Faker::Date.forward(23) }
     is_active  { Faker::Boolean.boolean }
  end
end
