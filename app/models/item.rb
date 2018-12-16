class Item < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  belongs_to :category
  validates :category, presence: true
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader

  def recepy
    out = []
    doses.each do |dose|
      out << dose.description + " " + dose.ingredient.name
    end
    return out
  end

  def photo_url
    return "https://res.cloudinary.com/dhsmfbjzf/"+ (photo.identifier || "")
  end
end