class Expert < ApplicationRecord
  has_many :experts_services, inverse_of: :expert
  has_many :services, through: :experts_services

  has_attached_file :avatar,
    styles: { 
      medium: ['300x300#', :png],
      thumb: ['100x100#', :png]
    },
    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :full_name, :specialty, :experience, presence: true

  accepts_nested_attributes_for :experts_services, allow_destroy: true
end
