ActiveAdmin.register Device do
  permit_params :fcm_token

  filter :id
end
