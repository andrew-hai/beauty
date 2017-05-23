module Api::V1
  class ContactsController < Api::ApplicationController
    def index
      render json: Contact.first.as_json(
        only: [
          :work_hours, :phone, :email, :site_url, :vk_url_1, :vk_url_2,
          :vk_url_3, :vk_url_4, :facebook_url, :twitter_url,
          :instagram_url, :address, :latitude, :longitude
        ]
      )
    end
  end
end
