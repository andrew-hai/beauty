class AddSubCategoryToExperts < ActiveRecord::Migration[5.0]
  def change
    add_reference :experts, :sub_category
    add_column :devices, :name, :string
  end
end
