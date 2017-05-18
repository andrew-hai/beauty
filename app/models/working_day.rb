class WorkingDay < ApplicationRecord
  belongs_to :expert, inverse_of: :working_days

  validates :start_time, :expert_id, presence: true
end
