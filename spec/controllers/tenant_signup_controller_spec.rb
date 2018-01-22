# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TenantSignupController, type: :controller do
  context 'GET new' do
    it 'renders the new tenant signup template' do
      get :new
      expect(response).to render_template :new
    end

    it 'assigns a blank tenant to the view' do
      get :new
      expect(assigns(:tenant)).to be_a_new(Tenant)
    end
  end

  context 'POST create' do
    it 'Register a new Tenant'
  end
end
