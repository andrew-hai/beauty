class AddMoreVkLinksToContacts < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :vk_url, :vk_url_1
    add_column :contacts, :vk_url_2, :string, after: :vk_url_1
    add_column :contacts, :vk_url_3, :string, after: :vk_url_2
    add_column :contacts, :vk_url_4, :string, after: :vk_url_3

    change_column :contacts, :latitude, :decimal, precision: 15, scale: 13
    change_column :contacts, :longitude, :decimal, precision: 15, scale: 13
  end
end
