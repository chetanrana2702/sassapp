# frozen_string_literal: true

# Main routes
Rails.application.routes.draw do
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
  # Make sure spree store only get visible when subdomain is there else default
  # Ruby on Rails appears
  # scope subdomain: /.+/ do
  #   mount Spree::Core::Engine, at: '/'
  # end
  scope subdomain: /.+/ do
    mount Spree::Core::Engine, at: '/'
    mount Ckeditor::Engine => '/ckeditor'
  end
  # Main Host App Routes
  # @warning do not move these up as this will conflict with
  # Host App default route and spree gem default route as both
  # points at '/'
  root to: 'home#index'
  # get 'signup', to: 'tenant_signup#new', as: 'signup'
  resources :tenant_signup, path: '', only: [] do
    collection do
      get 'signup', to: 'tenant_signup#new', as: 'signup_new'
      post 'signup', to: 'tenant_signup#create', as: 'signup_create'
    end
  end
  # For Admin Signin Page and Sessions Create
  get 'admin/signin', to: 'sessions#new', as: 'admin_signin'
  post 'admin/signin', to: 'sessions#create', as: 'admin_signin_create'
  # For Admin Dashboard Routes
  namespace :mainauthority, module: 'mainauthority' do
    resources :dashboard, only: :index
  end
  # config/routes.rb
  match '*path', to: 'errors#catch_404', via: :all
  # mount Spree::Core::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
