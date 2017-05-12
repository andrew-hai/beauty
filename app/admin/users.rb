ActiveAdmin.register User do
  permit_params :username,
                :email,
                :role,
                :password,
                :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :username
    tag_column :role
    actions
  end

  filter :username
  filter :email
  filter :role

  form do |f|
    f.inputs I18n.t(:user_details) do
      f.input :username
      f.input :email
      f.input :role, as: :select, collection: User.roles.keys.to_a
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :username
      tag_row :role
    end
  end

  controller do
    def update
      user = params[:user]
      if user && user[:password].blank?
        user.delete('password')
        user.delete('password_confirmation')
      end

      update!
    end
  end
end
