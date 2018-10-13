class AddMapAreaToMob < ActiveRecord::Migration[5.2]
  def change
    add_reference :mobs, :map_area, foreign_key: true
  end
end
