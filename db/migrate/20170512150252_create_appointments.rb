class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :full_name
      t.string :phone
      t.datetime :arranged_at
      t.string :status, null: false, default: :created
      t.text :aasm_state
      t.references :experts_service, index: true

      t.timestamps null: false
    end
  end
end
