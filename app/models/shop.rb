class Shop < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :shop_comments, dependent: :destroy

  has_one_attached :shop_image

  def get_shop_image
    (shop_image.attached?) ? shop_image : "no_shop_image.jpg"
  end

end
