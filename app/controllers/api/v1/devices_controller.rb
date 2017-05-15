module Api::V1
  class DevicesController < Api::ApplicationController
    def create
      device = Device.new(device_params)
      if device.save
        render json: device.as_json(only: [:id, :fcm_token])
      else
        render json: device.errors
      end
    end

    private def device_params
      params.require(:device).permit(:fcm_token)
    end
  end
end
