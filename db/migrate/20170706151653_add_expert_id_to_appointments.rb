class AddExpertIdToAppointments < ActiveRecord::Migration[5.0]
  def up
    add_reference :appointments, :expert
    add_column :appointments, :service_name, :string
    remove_column :appointments, :experts_service_id
  end

  def down
    remove_column :appointments, :expert_id
    remove_column :appointments, :service_name
    add_reference :appointments, :experts_service
  end
end
