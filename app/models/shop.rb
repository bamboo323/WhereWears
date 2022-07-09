class Shop < ApplicationRecord

  belongs_to :user

  belongs_to :genre, optional: true

  has_one_attached :shop_image

end
