class Service < ApplicationRecord
  belongs_to :sub_category
  has_many :experts_services, dependent: :destroy
  has_many :experts, through: :experts_services

  validates :name, :price, :sub_category, presence: true

  scope :search_by_name, ->(name) do
    includes(sub_category: :category)
      .where(<<-SQL, "%#{name}%", "%#{name}%", "%#{name}%"
          (LOWER(categories.name) LIKE LOWER(?)) OR
            (LOWER(sub_categories.name) LIKE LOWER(?)) OR
            (LOWER(services.name) LIKE LOWER(?))
        SQL
      ).order('categories.name ASC, sub_categories.name ASC, services.name ASC')
  end

  delegate :category, :label, :name, to: :sub_category, prefix: true, allow_nil: true

  def label
    "[#{sub_category_category.try(:name)}] [#{sub_category_name}] #{name}"
  end
end
