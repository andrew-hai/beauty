ActiveAdmin.register Contact do
  actions :all, except: [:new, :create, :destroy]

  before_filter :skip_sidebar!, only: :index

  permit_params :work_hours,
                :phone,
                :email,
                :site_url,
                :vk_url,
                :facebook_url,
                :twitter_url,
                :instagram_url,
                :address,
                :latitude,
                :longitude
end
