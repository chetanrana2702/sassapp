# frozen_string_literal: true

require 'rails_helper'

describe Tenant do
  subject { create(:tenant) }

  context 'set db_uuid' do
    it 'should not have hexadecimal string' do
      subject.db_uuid = nil
      subject.save
      expect(subject.db_uuid).to be(nil)
    end

    it 'should have hexadecimal string' do
      subject.db_uuid = '67c4f70e'
      subject.save
      expect(subject.db_uuid).to eq('67c4f70e')
    end
  end
end
