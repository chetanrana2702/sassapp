require 'rails_helper'

Rspec.feature 'Tenant', type: :feature do
  scenario 'Create a new Tenant' do
    visit '/signup'

    fill_in 'Email Address', with: 'jaibharat@mailinator.com'
    fill_in 'Password',      with: '123456'
    fill_in 'Password Confirmation', with: '123456'
    fill_in 'Store Name', with: 'mystore'

    click_button 'Create Tenant'
    expect(page).to have_text('mystore')
  end
end
