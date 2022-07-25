class TagRelationship < ApplicationRecord
  belongs_to :shop
  belongs_to :tag

  #publics/shopsコントローラのcreateに.uniqと書いてあるが念の為下記記述（同じタグを許さないバリデーション）
  validates :shop_id, uniqueness: { scope: :tag_id }
end
