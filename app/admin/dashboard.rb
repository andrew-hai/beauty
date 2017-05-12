ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
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
  end
end
