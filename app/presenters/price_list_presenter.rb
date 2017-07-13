class PriceListPresenter

  def self.data
    list = Category.includes(sub_categories: :services).order('categories.position ASC')

    list.map do |category|
      category.as_json(only: [:id, :name]).tap do |cj|
        cj[:services] = category.services.as_json(only: [:id, :name, :price, :position])
        cj[:sub_categories] = category.sub_categories.map do |sub_category|
          sub_category.as_json(only: [:id, :name]).tap do |scj|
            scj[:services] = sub_category.services.as_json(only: [:id, :name, :price, :position])
          end
        end
      end
    end
  end
end
