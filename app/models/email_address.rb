class EmailAddress < ApplicationRecord
  validates :email, presence: true
end
