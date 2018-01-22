# frozen_string_literal: true

# Model Class Order
# == Schema Information
#
# Table name: orders
#
#  id                           :integer          not null, primary key
#  manage_subscription_month_id :integer          not null
#  total_price                  :decimal(6, 2)    default(0.0), not null
#  payment_status               :boolean          default(FALSE), not null
#  payment_mode                 :boolean          default(FALSE), not null
#  transaction_unique_id        :integer          default(0), not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
class Order < ApplicationRecord
  # Associations
  belongs_to :manage_subscription_month
end
