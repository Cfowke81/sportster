Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'events#index'
  end


  resources :users, only: [:index, :show]
  resources :events, only: [:index, :show, :new, :create]
end
