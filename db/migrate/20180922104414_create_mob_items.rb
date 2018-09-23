class CreateMobItems < ActiveRecord::Migration[5.2]
  def change
    create_table :mob_items do |t|
      t.references :mob, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
