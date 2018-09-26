class Mob < ApplicationRecord
  mount_uploader :image, ImagesUploader

  # 関連
  has_many :mob_items
  has_many :items, through: :mob_items

  # 検証
  validates :name, presence: true
end
