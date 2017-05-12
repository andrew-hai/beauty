class SubCategory < ApplicationRecord
  validates :name, presence: true

  belongs_to :category, inverse_of: :sub_categories
  has_many :services, inverse_of: :sub_category

  def label
    "[#{category.name}] #{name}"
  end

  def self.sub_category_collection
    joins(:category).order('categories.name ASC, sub_categories.name ASC')
      .all.map{ |sc| [sc.label, sc.id] }
  end
end
