ActiveAdmin.register Contact do
  actions :all, except: [:new, :create, :destroy]

  before_filter :skip_sidebar!, only: :index

  permit_params :work_hours,
                :phone,
                :email,
                :site_url,
                :vk_url_1,
                :vk_url_2,
                :vk_url_3,
                :vk_url_4,
                :facebook_url,
                :twitter_url,
                :instagram_url,
                :address,
                :latitude,
                :longitude

  index do
    selectable_column
    id_column
    column :work_hours
    column :phone
    column :email
    column :site_url
    column :vk_url_1
    column :vk_url_2
    column :vk_url_3
    column :vk_url_4
    column :facebook_url
    column :twitter_url
    column :instagram_url
    column :address
    column :latitude
    column :longitude
    actions
  end

  form do |f|
    f.inputs I18n.t(:contact_details) do
      f.input :work_hours
      f.input :phone
      f.input :email
      f.input :site_url
      f.input :vk_url_1
      f.input :vk_url_2
      f.input :vk_url_3
      f.input :vk_url_4
      f.input :facebook_url
      f.input :twitter_url
      f.input :instagram_url
      f.input :address
      f.input :latitude
      f.input :longitude
    end

    f.actions
  end

  show do
    attributes_table do
      row :work_hours
      row :phone
      row :email
      row :site_url
      row :vk_url_1
      row :vk_url_2
      row :vk_url_3
      row :vk_url_4
      row :facebook_url
      row :twitter_url
      row :instagram_url
      row :address
      row :latitude
      row :longitude
    end
  end
end
