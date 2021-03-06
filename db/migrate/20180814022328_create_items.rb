class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :item_kind, foreign_key: true
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
