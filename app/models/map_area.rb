class MapArea < ApplicationRecord
  has_many :mob_map_areas
  has_many :mobs, -> { order 'mobs.name' }, through: :mob_map_areas
end
