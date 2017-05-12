class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price
      t.references :sub_category, index: true

      t.timestamps null: false
    end
  end
end
