ActiveAdmin.register About do
  actions :all, except: [:new, :create, :destroy]

  before_filter :skip_sidebar!, only: :index

  permit_params :about
end
