module Api::V1
  class ExpertsController < Api::ApplicationController
    def index
      render json: Expert.all.as_json(
        only: [:id, :full_name, :specialty, :experience, :description],
        methods: [:avatar_full_path, :sub_category_name]
      )
    end

    def show
      render json: expert.as_json(
        only: [:id, :full_name, :specialty, :experience, :description],
        methods: [:avatar_full_path, :sub_category_name, :services_json, :working_days_json]
      )
    end

    private def expert
      @expert ||= Expert.find(params[:id])
    end
  end
end
