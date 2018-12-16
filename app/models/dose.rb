class Dose < ApplicationRecord
  belongs_to :item
  belongs_to :ingredient
  validates :item, uniqueness: { scope: :ingredient }
end
