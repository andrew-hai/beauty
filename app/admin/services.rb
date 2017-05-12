ActiveAdmin.register Service do
  permit_params :name,
                :price,
                :sub_category_id

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :sub_category_label
    actions
  end

  filter :name
  filter :price

  form do |f|
    f.inputs I18n.t(:service_details) do
      f.input :name
      f.input :price
      f.input :sub_category, collection: SubCategory.sub_category_collection
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :price
      row :sub_category_label
    end
  end

  collection_action :search, method: :get do
    name = params['q']['groupings']['0']['name_contains']
    results = Service.search_by_name(name)

    render json: results.as_json(only: [:id], methods: [:label])
  end
end
