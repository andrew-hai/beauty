module Api::V1
  class EmailAddressesController < Api::ApplicationController
    def index
      render json: EmailAddress.first.as_json(only: [:email])
    end
  end
end
