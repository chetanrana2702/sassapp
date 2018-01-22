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


require 'rails_helper'

RSpec.describe Subscription, type: :model do

  describe 'associations' do
    it { should belong_to :tenant }
    it { should belong_to :plan }
  end

end
