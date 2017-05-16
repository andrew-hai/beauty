Rails.application.routes.draw do
  root 'admin/dashboard#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index, :create] do
        put :cancel, on: :member
      end
      resources :devices, only: [:create]
      resources :experts, only: [:index, :show]
      resources :experts_services, only: [:index]
      resources :posts, only: [:index]
      resources :services, only: [:index]
    end
  end

  ActiveAdmin.routes(self)
end
