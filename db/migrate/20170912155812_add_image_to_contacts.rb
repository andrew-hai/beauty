class AddImageToContacts < ActiveRecord::Migration[5.0]
  def up
    add_attachment :contacts, :image
  end

  def down
    remove_attachment :contacts, :image
  end
end
