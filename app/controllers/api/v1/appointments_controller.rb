module Api::V1
  class DevicesController < Api::ApplicationController
    def create
      appointment = Appointment.def appointment_params)
      if appointment.save
        render json: appointment.as_json(
          only: [:id, :device_id, :full_name, :phone, :arranged_at, :aasm_state]
        )
      else
        render json: appointment.errors
      end
    end

    private def appointment_params
      params.require(:appointment).permit(
        :device_id,
        :full_name,
        :phone,
        :arranged_at,
        :experts_service_id,
      )
    end
  end
end
