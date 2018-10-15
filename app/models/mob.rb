class Mob < ApplicationRecord
  mount_uploader :image, ImagesUploader

  # 関連
  has_many :mob_map_areas
  has_many :map_areas, -> { order 'map_areas.name' }, through: :mob_map_areas
  has_many :mob_items
  has_many :items, -> { order 'items.name' }, through: :mob_items

  # 検証
  validates :name, presence: true
end
