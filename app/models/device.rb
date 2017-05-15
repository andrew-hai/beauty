class Device < ApplicationRecord
  validates :fcm_token, presence: true
  validates :fcm_token, uniqueness: true
end
