class Device < ApplicationRecord
  has_many :appointments, inverse_of: :device

  validates :fcm_token, presence: true
  validates :fcm_token, uniqueness: true

  def name
    "Устройство ##{id}"
  end
end
