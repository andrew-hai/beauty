class AddPositionToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :position, :integer, default: 1, null: false
  end
end
