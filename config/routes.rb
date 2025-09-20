Rails.application.routes.draw do
  root 'books#index'

  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }

  devise_scope :admin do
    get  '/admins/auth/:provider',          to: 'admins/omniauth_callbacks#passthru', as: :admin_omniauth_authorize
    post '/admins/auth/:provider',          to: 'admins/omniauth_callbacks#passthru'
    get  '/admins/auth/:provider/callback', to: 'admins/omniauth_callbacks#google_oauth2', as: :admin_omniauth_callback
    post '/admins/auth/:provider/callback', to: 'admins/omniauth_callbacks#google_oauth2'
  end

  get 'dashboard', to: 'dashboards#show', as: :dashboard

  resources :user_books
  resources :users
  resources :books
end
