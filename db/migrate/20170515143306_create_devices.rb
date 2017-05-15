class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :fcm_token

      t.timestamps null: false
    end
  end
end
