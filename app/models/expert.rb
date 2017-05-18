class Expert < ApplicationRecord
  include ActionView::Helpers::AssetUrlHelper

  has_many :experts_services
  has_many :services, through: :experts_services
  has_many :working_days, inverse_of: :expert

  has_attached_file :avatar,
    styles: { 
      medium: ['300x300#', :png],
      thumb: ['100x100#', :png]
    },
    default_url: '/assets/:style/missing.png'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :full_name, :specialty, :experience, presence: true

  accepts_nested_attributes_for :experts_services, allow_destroy: true

  def avatar_full_path
    image_url(avatar.url(:medium))
  end

  def services_json
    services.as_json(only: [:id], methods: [:label])
  end

  def working_days_json
    working_days.map(&:start_time)
  end
end
