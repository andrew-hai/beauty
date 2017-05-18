class CreateWorkingDays < ActiveRecord::Migration[5.0]
  def change
    create_table :working_days do |t|
      t.references :expert, index: true
      t.datetime :start_time

      t.timestamps null: false
    end
  end
end
