class Item < ApplicationRecord
  belongs_to :item_kind
  mount_uploader :image, ImagesUploader

  # 検証
  validates :name, presence: true
end
