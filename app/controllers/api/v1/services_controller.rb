module Api::V1
  class ServicesController < Api::ApplicationController
    def index
      render json: Service.all.as_json(only: [:id, :name, :price])
    end
  end
end
