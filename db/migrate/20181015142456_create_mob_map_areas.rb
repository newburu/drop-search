class CreateMobMapAreas < ActiveRecord::Migration[5.2]
  def change
    remove_reference :mobs, :map_area

    create_table :mob_map_areas do |t|
      t.references :mob, foreign_key: true
      t.references :map_area, foreign_key: true

      t.timestamps
    end
  end
end
