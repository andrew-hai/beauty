class Contact < ApplicationRecord
  validates :work_hours, :phone, :email, presence: true
end
