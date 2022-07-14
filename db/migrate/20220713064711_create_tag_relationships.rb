class CreateTagRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relationships do |t|
      t.references :shop, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
     #タグ検索機能導入のため、unique: trueは、shop_id,tag_idでワンセット。全く同じ記述をゆるなさい
     add_index :tag_relationships, [:shop_id,:tag_id],unique: true
  end
end
