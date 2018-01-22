# frozen_string_literal: true

# Model Class Subscription
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
class Subscription < ApplicationRecord
  # Associations
  belongs_to :tenant
  belongs_to :plan
  has_many   :manage_subscription_months
end
