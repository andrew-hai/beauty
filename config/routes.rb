Rails.application.routes.draw do
  root 'admin/dashboard#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:create]
      resources :devices, only: [:create]
      resources :experts, only: [:index, :show]
      resources :posts, only: [:index]
      resources :services, only: [:index]
    end
  end

  ActiveAdmin.routes(self)
end
