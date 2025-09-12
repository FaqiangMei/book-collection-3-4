Rails.application.routes.draw do
  resources :user_books
  resources :users
  resources :books 

  root "user_books#index"
end
