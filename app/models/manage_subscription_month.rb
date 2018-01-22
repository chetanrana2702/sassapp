# frozen_string_literal: true

# Model Class ManageSubscriptionMonth
# == Schema Information
#
# Table name: manage_subscription_months
#
#  id                     :integer          not null, primary key
#  subscription_id        :integer          not null
#  plan_name_translations :text(65535)      default("'\"{}\"'"), not null
#  month_number           :integer          default(0), not null
#  total_months           :integer          default(0), not null
#  actual_plan_price      :decimal(6, 2)    default(0.0), not null
#  coupon_code            :integer          default(0), not null
#  discount_in_percnt     :integer
#  discount_fixed_amount  :decimal(6, 2)    default(0.0)
#  discounted_price       :decimal(6, 2)    default(0.0), not null
#  total_price            :decimal(6, 2)    default(0.0), not null
#  starts_on              :datetime         not null
#  ends_on                :datetime         default(NULL), not null
#  order_generated        :boolean          default(FALSE), not null
#  full_payment_received  :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class ManageSubscriptionMonth < ApplicationRecord
  # Associations
  belongs_to :subscription
  has_many   :orders
end
