ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # Here is an example of a simple dashboard with columns and panels.
    columns do
      column do
        panel 'Последние приемы' do
          ul do
            Appointment.order(id: :desc).limit(15).map do |appointment|
              li link_to(
                "#{appointment.full_name} - #{appointment.experts_service_label}",
                admin_appointment_path(appointment)
              )
            end
          end
        end
      end

      column do
        panel 'Последние новости' do
          ul do
            Post.order(id: :desc).limit(15).map do |post|
              li link_to(post.title, admin_post_path(post))
            end
          end
        end
      end
    end

    div do
      div do
        h3 'API calls:'
        h4 'Appointments:'
        ul do
          li 'GET http://46.254.19.175/api/v1/appointments?device_id=$device_id'
          li 'POST http://46.254.19.175/api/v1/appointments - required params [:device_id, :full_name, :phone, :arranged_at, :experts_service_id]'
          li 'GET http://46.254.19.175/api/v1/appointments/$appointment_id'
          li 'PUT http://46.254.19.175/api/v1/appointments/$appointment_id/cancel'
        end
        h4 'Contacts'
        ul do
          li 'GET http://46.254.19.175/api/v1/contacts'
        end
        h4 'Devices'
        ul do
          li 'POST http://46.254.19.175/api/v1/devices - required params [:fcm_token]'
        end
        h4 'Experts'
        ul do
          li 'GET http://46.254.19.175/api/v1/experts'
          li 'GET http://46.254.19.175/api/v1/experts/$expert_id'
        end
        h4 'ExpertsServices'
        ul do
          li 'GET http://46.254.19.175/api/v1/experts_services?service_id=$service_id'
        end
        h4 'Posts'
        ul do
          li 'GET http://46.254.19.175/api/v1/posts'
        end
        h4 'Services'
        ul do
          li 'GET http://46.254.19.175/api/v1/services'
          li 'GET http://46.254.19.175/api/v1/services/price_list'
        end
      end
    end
  end
end
 