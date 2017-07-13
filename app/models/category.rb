class Category < ApplicationRecord
  validates :name, presence: true

  has_many :sub_categories, inverse_of: :category
  has_many :services, -> { order(position: :asc) }, inverse_of: :owner, as: :owner

  accepts_nested_attributes_for :sub_categories, allow_destroy: true

  def label
    "[#{name}]"
  end
end
