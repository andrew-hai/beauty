class SubCategory < ApplicationRecord
  validates :name, presence: true

  belongs_to :category
  has_many :services, inverse_of: :sub_category

  delegate :name, to: :category, prefix: true, allow_nil: true

  def label
    "[#{category_name}] #{name}"
  end
end
