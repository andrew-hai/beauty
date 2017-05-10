Rails.application.routes.draw do
  root 'admin/dashboard#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
    end
  end

  ActiveAdmin.routes(self)
end
