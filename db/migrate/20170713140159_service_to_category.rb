class ServiceToCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :services, :sub_category_id, :owner_id
    add_column :services, :owner_type, :string, null: false, default: 'SubCategory', after: :owner_id
  end
end
