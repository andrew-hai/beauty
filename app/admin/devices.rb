ActiveAdmin.register Device do
  permit_params :fcm_token, :name

  filter :id
  filter :fcm_token
  filter :name

  index do
    selectable_column
    id_column
    column :fcm_token
    column :name
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs I18n.t(:device_details) do
      f.input :fcm_token
      f.input :name
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :fcm_token
      row :name
      row :created_at
      row :updated_at
    end
  end
end
