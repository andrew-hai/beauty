ActiveAdmin.register Expert do
  permit_params :full_name,
                :avatar,
                :specialty,
                :experience,
                :description,
                experts_services_attributes: [:id, :service_id, :_destroy]

  index do
    selectable_column
    id_column
    column :full_name
    image_column :avatar, style: :thumb
    column :specialty
    column :experience
    column :description
    actions
  end

  filter :full_name
  filter :specialty
  filter :experience

  form do |f|
    f.inputs I18n.t(:expert_details) do
      f.input :full_name
      f.input :avatar
      f.input :specialty
      f.input :experience
      f.input :description
    end

    f.inputs I18n.t(:experts_services) do
      f.has_many :experts_services, heading: false, allow_destroy: true do |sc|
        sc.input :service_id,
          as: :search_select, url: search_admin_services_path,
          fields: [:name], display_name: :label, minimum_input_length: 3
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :full_name
      image_row :avatar, style: :medium
      row :specialty
      row :experience
      row :description
    end

    panel I18n.t(:experts_services) do
      table_for expert.services do
        column :id
        column I18n.t(:service), :label
      end
    end
  end

  collection_action :search, method: :get do
    name = params['q']['groupings']['0']['name_contains']
    results = ExpertsService.search_by_name(name)

    render json: results.as_json(only: [:id], methods: [:label])
  end
end