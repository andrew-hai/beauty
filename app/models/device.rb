class Device < ApplicationRecord
  has_many :appointments

  validates :fcm_token, :name, presence: true
  validates :fcm_token, uniqueness: true
end
