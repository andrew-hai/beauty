class CreateAbouts < ActiveRecord::Migration[5.0]
  def change
    create_table :abouts do |t|
      t.text :about

      t.timestamps null: false
    end
  end
end
