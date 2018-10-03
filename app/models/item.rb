class Item < ApplicationRecord
  mount_uploader :image, ImagesUploader

  # 関連
  belongs_to :item_kind
  has_many :mob_items
  has_many :mobs, -> { order 'mobs.name' }, through: :mob_items

  # 検証
  validates :name, presence: true
end
