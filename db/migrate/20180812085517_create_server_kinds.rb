class CreateServerKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :server_kinds do |t|
      t.references :site_kind, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
