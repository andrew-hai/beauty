class Appointment < ApplicationRecord
  include AASM

  aasm do
    state :created, initial: true
    state :processing, :approved, :canceled

    event :process do
      transitions from: :created, to: :processing
    end

    event :approve do
      transitions from: :processing, to: :approved
    end

    event :cancel do
      transitions from: [:created, :processing], to: :canceled
    end
  end

  belongs_to :device
  belongs_to :experts_service

  validates :full_name, :phone, :arranged_at, :device, :experts_service, presence: true

  delegate :expert, :service, to: :experts_service, allow_nil: true
  delegate :full_name, :avatar_full_path, :description, to: :expert, prefix: true, allow_nil: true
  delegate :name, to: :service, prefix: true, allow_nil: true

  def experts_service_label
    experts_service.label
  end
end
