class Contact < ApplicationRecord
  include ActionView::Helpers::AssetUrlHelper

  has_attached_file :image, styles: { medium: ['600x600>', :png], thumb: ['100x100>', :png] }

  validates :work_hours, :phone, :email, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_full_path
    image_url(image.url(:medium), host: Rails.application.config.action_controller.asset_host)
  end
end
