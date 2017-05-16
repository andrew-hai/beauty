class SubCategory < ApplicationRecord
  validates :name, presence: true

  belongs_to :category, inverse_of: :sub_categories
  has_many :services, inverse_of: :sub_category

  def label
    "[#{category.name}] #{name}"
  end
end
