module Admin
  class WorkingDaysController < ApplicationController
    def toggle
      start_time = DateTime.parse(working_day_params[:start_time])
      working_day = expert.working_days.where(start_time: start_time).first
      if working_day
        working_day.destroy
      else
        expert.working_days.create(start_time: start_time)
      end

      render json: true
    end

    private def working_day_params
      params.require(:working_day).permit(:expert_id, :start_time)
    end

    private def expert
      @expert ||= Expert.find(working_day_params[:expert_id])
    end
  end
end
