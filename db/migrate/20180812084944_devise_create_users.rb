class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ##Omniauthable
      t.integer :uid, :limit => 8 #bigintにする
      t.string :name
      t.string :screen_name
      t.string :provider
      t.string :password

      t.string :access_token
      t.string :access_token_secret

      t.timestamps null: false
    end

    add_index :users, :uid,  :unique => true
  end
end
