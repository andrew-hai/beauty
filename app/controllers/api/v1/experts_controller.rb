module Api::V1
  class ExpertsController < Api::ApplicationController
    def index
      render json: Expert.all.as_json(
        only: [:id, :full_name, :specialty, :experience, :description],
        methods: [:avatar]
      )
    end

    def show
      render json: expert.as_json(
        only: [:id, :full_name, :specialty, :experience, :description],
        methods: [:avatar]
      )
    end

    private def expert
      @expert ||= Expert.find(params[:id])
    end
  end
end
