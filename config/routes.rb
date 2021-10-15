Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth', sessions: 'users/sessions', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :posts
end
