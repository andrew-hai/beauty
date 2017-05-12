ActiveAdmin.register Category do
  permit_params :name,
                sub_categories_attributes: [:id, :name, :desctiprion, :_destroy]
  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs I18n.t(:category_details) do
      f.input :name

      f.inputs I18n.t(:sub_categories) do
        f.has_many :sub_categories, heading: false, allow_destroy: true do |sc|
          sc.input :name
        end
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :created_at
    end

    panel I18n.t(:sub_categories) do
      table_for category.sub_categories do
        column :id
        column :name
      end
    end
  end
end
