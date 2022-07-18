class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.integer :genre_id
      t.string :shop_name
      t.string :shop_address
      t.text :shop_detail
      t.integer :user_id
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
