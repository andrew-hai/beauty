module Api::V1
  class AppointmentsController < Api::ApplicationController
    def index
      appointments = Appointment.where(device_id: params[:device_id])

      render json: appointments.as_json(
        only: [:id, :device_id, :full_name, :phone, :arranged_at, :aasm_state, :service_name],
        methods: [:expert_full_name, :expert_description, :expert_avatar_full_path]
      )
    end

    def create
      @appointment = Appointment.create(appointment_params)

      if appointment.save
        AppointmentMailer.created(@appointment).deliver
        render json: appointment.as_json(
          only: [:id, :device_id, :full_name, :phone, :arranged_at, :aasm_state, :service_name],
          methods: [:expert_full_name, :expert_description, :expert_avatar_full_path]
        )
      else
        render json: appointment.errors, status: 422
      end
    end

    def show
      render json: appointment.as_json(
        only: [:id, :device_id, :full_name, :phone, :arranged_at, :aasm_state, :service_name],
        methods: [:expert_full_name, :expert_description, :expert_avatar_full_path]
      )
    end

    def destroy
      if appointment.destroy
        render json: :ok
      else
        render json: appointment.errors, status: 422
      end
    end

    private def appointment_params
      params.require(:appointment).permit(
        :device_id,
        :full_name,
        :phone,
        :arranged_at,
        :service_name,
        :expert_id
      )
    end

    private def appointment
      @appointment ||= Appointment.find(params[:id])
    end
  end
end
