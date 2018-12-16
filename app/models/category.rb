class Category < ApplicationRecord
  has_many :items
  has_many :tags

  def self.opposite_category(category_id)
    return category_id == 0 ? 1 : 0
  end
end
