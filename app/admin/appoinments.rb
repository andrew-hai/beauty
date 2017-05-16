include ApplicationHelper

ActiveAdmin.register Appointment do
  permit_params :full_name,
                :phone,
                :arranged_at,
                :aasm_state,
                :device_id,
                :experts_service_id

  index do
    selectable_column
    id_column
    column :full_name
    column :phone
    column :arranged_at
    state_column :aasm_state
    column :device
    column :experts_service_label
    column :created_at
    actions
  end

  filter :full_name
  filter :phone
  filter :arranged_at
  filter :device_id
  filter :aasm_state
  filter :created_at

  form do |f|
    f.inputs I18n.t(:appointment_details) do
      f.input :full_name
      f.input :phone
      f.input :arranged_at, as: :date_time_picker
      f.input :aasm_state, as: :select, collection: appointment_states_collection
      f.input :device
      f.input :experts_service_id,
        as: :search_select, url: search_admin_experts_path,
        placeholder: I18n.t('formtastic.placeholders.appointment.experts_service_id'),
        fields: [:name], display_name: :label, minimum_input_length: 3
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone
      row :arranged_at
      state_row :aasm_state
      row :device
      row :experts_service_label
      row :created_at
    end
  end
end
