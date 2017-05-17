class ExpertsService < ApplicationRecord
  belongs_to :expert
  belongs_to :service
  has_many :appointments

  validates :expert_id, :service_id, presence: true
  validates :service_id, uniqueness: { scope: :expert_id }

  scope :search_by_name, ->(name) do
    includes(:expert, service: { sub_category: :category })
      .where(<<-SQL, "%#{name.downcase}%", "%#{name.downcase}%", "%#{name.downcase}%", "%#{name.downcase}%"
          (LOWER(categories.name) LIKE ?) OR (LOWER(sub_categories.name) LIKE ?)
          OR (LOWER(experts.full_name) LIKE ?) OR (LOWER(services.name) LIKE ?)
        SQL
      ).order('experts.full_name ASC, services.name ASC')
  end

  def expert_full_name
    expert.full_name
  end

  def label
    "#{expert.full_name} - #{service.label}"
  end
end
