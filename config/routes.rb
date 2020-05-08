Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'

  resources :spas do
    resources :technicians, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :treatments, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :appointments, only: [:new, :edit]
  end

  resources :users, only: [] do
    resources :appointments, only: [:index, :show, :destroy]
  end

  resources :appointments, only: [:create, :update]
end
