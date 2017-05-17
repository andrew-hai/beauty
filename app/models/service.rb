class Service < ApplicationRecord
  belongs_to :sub_category
  has_many :experts_services
  has_many :experts, through: :experts_services

  validates :name, :price, :sub_category, presence: true

  scope :search_by_name, ->(name) do
    includes(sub_category: :category)
      .where(<<-SQL, "%#{name.downcase}%", "%#{name.downcase}%", "%#{name.downcase}%"
          (LOWER(categories.name) LIKE ?) OR (LOWER(sub_categories.name) LIKE ?) OR (LOWER(services.name) LIKE ?)
        SQL
      ).order('categories.name ASC, sub_categories.name ASC, services.name ASC')
  end

  def label
    "[#{sub_category.category.name}] [#{sub_category.name}] #{name}"
  end

  def sub_category_label
    sub_category.label
  end
end
