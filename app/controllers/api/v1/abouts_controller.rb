module Api::V1
  class AboutsController < Api::ApplicationController
    def index
      render json: About.first.as_json(only: [:about])
    end
  end
end
