class ExpertsService < ApplicationRecord
  belongs_to :expert, inverse_of: :experts_services
  belongs_to :service, inverse_of: :experts_services
  has_many :appointments, inverse_of: :experts_service

  validates :expert_id, :service_id, presence: true
  validates :service_id, uniqueness: { scope: :expert_id }

  scope :search_by_name, ->(name) do
    includes(:expert, :service)
      .where(<<-SQL, "%#{name.downcase}%", "%#{name.downcase}%"
          (LOWER(experts.full_name) LIKE ?) OR (LOWER(services.name) LIKE ?)
        SQL
      ).order('experts.full_name ASC, services.name ASC')
  end

  def expert_full_name
    expert.full_name
  end

  def label
    "#{expert.full_name} - #{service.name}"
  end
end
