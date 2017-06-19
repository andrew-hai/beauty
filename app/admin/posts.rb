require 'fcm'

ActiveAdmin.register Post do
  permit_params :title,
                :text

  index do
    selectable_column
    id_column
    column :title
    column :text
    column :created_at

    actions defaults: true do |post|
      link_to I18n.t(:send_to_fcm), send_to_fcm_admin_post_path(post)
    end
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs I18n.t(:post_details) do
      f.input :title
      f.input :text
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :text
      row :created_at
    end
  end

  action_item :send_to_fcm, only: :show do
    link_to I18n.t(:send_to_fcm), send_to_fcm_admin_post_path(post)
  end

  member_action :send_to_fcm, method: :get do
    registration_ids = Device.pluck(:fcm_token)

    response = if registration_ids.any?
      fcm = FCM.new(Rails.application.secrets.firebase_api_key)
      options = {
        priority: 'normal',
        notification: {
          body: resource.text,
          title: resource.title,
          icon: 'new'
        },
        data: { title: resource.title, text: resource.text }
      }
      fcm.send(registration_ids, options)
    end

    if response && response[:status_code] == 200
      flash[:notice] = I18n.t('post.send_to_fcm.status_messages.200')
    else
      flash[:error] = I18n.t('post.send_to_fcm.status_messages.422')
    end

    redirect_to action: :index
  end
end
