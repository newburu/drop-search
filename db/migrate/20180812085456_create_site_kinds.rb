class CreateSiteKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :site_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
