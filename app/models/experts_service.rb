class ExpertsService < ApplicationRecord
  belongs_to :expert
  belongs_to :service
  has_many :appointments

  validates :service_id, presence: true
  validates :service_id, uniqueness: { scope: :expert_id }

  scope :search_by_name, ->(name) do
    includes(:expert, service: { sub_category: :category })
      .where(<<-SQL, "%#{name}%", "%#{name}%", "%#{name}%", "%#{name}%"
          (LOWER(categories.name) LIKE LOWER(?)) OR
          (LOWER(sub_categories.name) LIKE LOWER(?)) OR
          (LOWER(experts.full_name) LIKE LOWER(?)) OR
          (LOWER(services.name) LIKE LOWER(?))
        SQL
      ).order('experts.full_name ASC, services.name ASC')
  end

  delegate :full_name, to: :expert, prefix: true, allow_nil: true
  delegate :label, to: :service, prefix: true, allow_nil: true

  def label
    "#{expert_full_name} - #{service_label}"
  end
end
