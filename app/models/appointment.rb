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

  belongs_to :device, inverse_of: :appointments
  belongs_to :experts_service, inverse_of: :appointments

  validates :full_name, :phone, :arranged_at, :device, :experts_service, presence: true

  def experts_service_label
    experts_service.label
  end
end
