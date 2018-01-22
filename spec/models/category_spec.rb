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


require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'associations' do
    it { should have_many :tenants }
  end

end
