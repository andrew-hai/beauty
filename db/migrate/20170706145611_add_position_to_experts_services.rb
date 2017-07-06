class AddPositionToExpertsServices < ActiveRecord::Migration[5.0]
  def change
    add_column :experts, :position, :integer, default: 1, null: false
    add_column :services, :position, :integer, default: 1, null: false
  end
end
