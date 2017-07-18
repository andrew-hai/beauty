include ApplicationHelper

ActiveAdmin.register Service do
  config.sort_order = 'position_asc'

  permit_params :name,
                :price,
                :position,
                :owner_data

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :position
    column :owner_label
    actions
  end

  filter :name
  filter :price

  form do |f|
    f.inputs I18n.t(:service_details) do
      f.input :name
      f.input :price
      f.input :position
      f.input :owner_data, collection: service_owners_list
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :price
      row :position
      row :owner_label
    end
  end

  collection_action :search, method: :get do
    name = params['q']['groupings']['0']['name_contains']
    results = Service.search_by_name(name)

    render json: results.as_json(only: [:id], methods: [:label])
  end

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_services_path } if resource.valid?
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_services_path } if resource.valid?
      end
    end
  end
end
