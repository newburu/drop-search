class Item < ApplicationRecord
  mount_uploader :image, ImagesUploader

  # 関連
  belongs_to :item_kind
  has_many :mob_items
  has_many :mobs, -> { order 'mobs.name' }, through: :mob_items

  # 検証
  validates :name, presence: true
  
  # マップエリアをキーとしたハッシュに変更
  def map_area_mobs
    ret = {}
    self.mobs.each do |mob|
      mob.map_areas.each do |map_area|
        if ret[map_area.name].present?
          ret[map_area.name].push(mob)
        else
          ret[map_area.name] = [mob]
        end
      end
    end
    
    Hash[ ret.sort ]
  end
  
end
