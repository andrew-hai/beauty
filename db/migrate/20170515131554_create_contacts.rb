class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.text :work_hours
      t.string :phone
      t.string :email
      t.string :site_url
      t.string :vk_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
