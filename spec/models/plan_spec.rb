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


require 'rails_helper'

RSpec.describe Plan, type: :model do

  describe 'associations' do
    it { should have_many :subscriptions }
    it { should have_many :discounts }
  end

end
