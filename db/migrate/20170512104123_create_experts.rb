class CreateExperts < ActiveRecord::Migration[5.0]
  def change
    create_table :experts do |t|
      t.string :full_name
      t.attachment :avatar
      t.string :specialty
      t.string :experience
      t.text :description

      t.timestamps null: false
    end
  end
end
