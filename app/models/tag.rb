class Tag < ApplicationRecord
  has_many :tag_relationships, dependent: :destroy
  has_many :shops, through: :tag_relationships

  #タグの名前が重複して保存されるのを防ぐ
  validates :tag_name, uniqueness: true
end
