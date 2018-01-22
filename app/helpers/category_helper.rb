# frozen_string_literal: true

# Helper module Category responsible for providing
# list of active categories.
module CategoryHelper
  def categories
    data = []
    Category.order(id: :desc).map do |dataset|
      data << [eval(dataset.name_translations)[:en].capitalize, dataset.id]
    end
    data
  end
end
