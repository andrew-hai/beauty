ActiveAdmin.register Post do
  permit_params :title,
                :text
  index do
    selectable_column
    id_column
    column :title
    column :text
    column :created_at
    actions
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
end
