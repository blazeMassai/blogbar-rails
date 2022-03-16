Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  'signup', to: 'users#new', as: 'signup'
  get  'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logged-out'
  resources :users
end
