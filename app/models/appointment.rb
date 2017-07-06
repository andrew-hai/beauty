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
      transitions from: [:created, :processing, :approved], to: :canceled
    end
  end

  belongs_to :device
  belongs_to :expert

  validates :full_name, :phone, :arranged_at, :device, :expert, :service_name, presence: true

  delegate :full_name, :avatar_full_path, :description, to: :expert, prefix: true, allow_nil: true
end
