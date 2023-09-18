Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users
  resources :books
  get 'home/about' => 'homes#about'
  get 'users/sign_up'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
