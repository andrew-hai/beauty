Rails.application.routes.draw do
  root 'admin/dashboard#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index, :create, :show] do
        put :cancel, on: :member
      end
      resources :contacts, only: [:index]
      resources :devices, only: [:create]
      resources :experts, only: [:index, :show]
      resources :experts_services, only: [:index]
      resources :posts, only: [:index]
      resources :services, only: [:index] do
        get :price_list, on: :collection
      end
    end
  end

  ActiveAdmin.routes(self)
end
