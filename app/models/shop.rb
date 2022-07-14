class Shop < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :shop_comments, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships

  has_one_attached :shop_image

  def get_shop_image
    (shop_image.attached?) ? shop_image : "no_shop_image.jpg"
  end

  def save_tags(saveshop_tags)
    saveshop_tags.each do |new_name|
      shop_tag = Tag.find_or_create_by(tag_name: new_name)
      #selfはコントローラー使われている@shop
      #tagsはアソシエーションで結ばれているtagsモデル
      #.tagsにshop_tagを追加する(保存処理が行われる)『<<』は保存の機能
      self.tags << shop_tag
    end
  end

  def self.search(search)
    if search
      #pluck(:id)でTagのidだけを取ってくる
      tag_ids = Tag.where(['tag_name LIKE?', "%#{search}%"]).pluck(:id)
      #pluck(:shop_id)でTagのidだけを取ってくる
      Shop.where(id:TagRelationship.where(tag_id:tag_ids).pluck(:shop_id))
    else
      all
    end
  end

end
