class Service < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :experts_services, dependent: :destroy
  has_many :experts, through: :experts_services

  validates :name, :price, :owner_data, :owner, presence: true

  scope :search_by_name, ->(name) do
    includes(:owner)
      .joins("LEFT OUTER JOIN categories ON categories.id = services.owner_id AND services.owner_type = 'Category'")
      .joins("LEFT OUTER JOIN sub_categories ON sub_categories.id = services.owner_id AND services.owner_type = 'SubCategory'")
      .where(<<-SQL, "%#{name}%", "%#{name}%", "%#{name}%"
          (LOWER(categories.name) LIKE LOWER(?)) OR
            (LOWER(sub_categories.name) LIKE LOWER(?)) OR
            (LOWER(services.name) LIKE LOWER(?))
        SQL
      ).order('categories.name ASC, sub_categories.name ASC, services.name ASC')
  end

  delegate :label, to: :owner, prefix: true, allow_nil: true

  def owner_data=(value)
    if value.present?
      self.owner_id = value.split('::')[1]
      self.owner_type = value.split('::')[0]
    end
  end

  def owner_data
    "#{owner.class}::#{owner.id}" if owner.present?
  end

  def label
    "#{owner_label} #{name}"
  end
end
