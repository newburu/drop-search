class Mob < ApplicationRecord
  mount_uploader :image, ImagesUploader

  # 検証
  validates :name, presence: true
end
