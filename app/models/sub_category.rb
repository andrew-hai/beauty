class SubCategory < ApplicationRecord
  validates :name, presence: true

  belongs_to :category
  has_many :services, inverse_of: :sub_category

  def label
    "[#{category.name}] #{name}"
  end
end
