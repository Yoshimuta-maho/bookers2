Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"

  resources :book, only: [:new, :create, :index,  :edit, :update, :show]
  resources :users

  get 'homes/about' => "homes#about", as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
