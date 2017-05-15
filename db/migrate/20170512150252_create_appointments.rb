class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :full_name
      t.string :phone
      t.datetime :arranged_at
      t.string :aasm_state, null: false, default: :created
      t.references :experts_service, index: true

      t.timestamps null: false
    end
  end
end
