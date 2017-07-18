ActiveAdmin.register Category do
  config.sort_order = 'position_asc'

  permit_params :name,
                :position,
                sub_categories_attributes: [:id, :name, :desctiprion, :_destroy]
  index do
    selectable_column
    id_column
    column :name
    column :position
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs I18n.t(:category_details) do
      f.input :name
      f.input :position

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
      row :position
      row :created_at
    end

    panel I18n.t(:sub_categories) do
      table_for category.sub_categories do
        column :id
        column :name
      end
    end
  end

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_categories_path } if resource.valid?
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_categories_path } if resource.valid?
      end
    end
  end
end
