module Api::V1
  class DevicesController < Api::ApplicationController
    def index
      appointments = Appointment.where(device_id: params[:device_id])

      render json: appointments.as_json(
        only: [:id, :device_id, :full_name, :phone, :arranged_at, :aasm_state, :experts_service_id]
      )
    end

    def create
      @appointment = Appointment.create(appointment_params)

      if appointment.save
        render json: appointment.as_json(
          only: [:id, :device_id, :full_name, :phone, :arranged_at, :aasm_state, :experts_service_id]
        )
      else
        render json: appointment.errors, status: 422
      end
    end

    def cancel
      if appointment.cancel!
        render json: :ok
      else
        render json: appointment.errors, status: 422
      end
    end

    def show
      render json: appointment.as_json(
        only: [:id, :device_id, :full_name, :phone, :arranged_at, :aasm_state, :experts_service_id]
      )
    end

    private def appointment_params
      params.require(:appointment).permit(
        :device_id,
        :full_name,
        :phone,
        :arranged_at,
        :experts_service_id
      )
    end

    private def appointment
      @appointment ||= Appointment.find(params[:id])
    end
  end
end
