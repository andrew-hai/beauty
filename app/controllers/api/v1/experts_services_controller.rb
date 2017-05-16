module Api::V1
  class ExpertsServicesController < Api::ApplicationController
    def index
      render json: ExpertsService.where(service_id: params[:service_id]).as_json(
        only: [:id, :expert_id, :service_id],
        methods: [:expert_full_name]
      )
    end
  end
end
