class Category < ApplicationRecord
  validates :name, presence: true

  has_many :sub_categories, inverse_of: :category

  accepts_nested_attributes_for :sub_categories, allow_destroy: true
end
