Rails.application.routes.draw do
  root 'admin/dashboard#index'

  devise_for :users

  namespace :admin do
    resources :working_days, only: [] do
      post :toggle, on: :collection
    end
  end

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index, :create, :show] do
        put :cancel, on: :member
      end
      resources :contacts, only: [:index]
      resources :devices, only: [:create]
      resources :email_addresses, only: [:index]
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
