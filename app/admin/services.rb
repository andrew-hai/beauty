include ApplicationHelper

ActiveAdmin.register Service do
  config.sort_order = 'position_asc'

  permit_params :name,
                :price,
                :position,
                :sub_category_id

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :position
    column :sub_category_label
    actions
  end

  filter :name
  filter :price

  form do |f|
    f.inputs I18n.t(:service_details) do
      f.input :name
      f.input :price
      f.input :position
      f.input :sub_category, collection: sub_category_collection
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :price
      row :position
      row :sub_category_label
    end
  end

  collection_action :search, method: :get do
    name = params['q']['groupings']['0']['name_contains']
    results = Service.search_by_name(name)

    render json: results.as_json(only: [:id], methods: [:label])
  end
end
