class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  #フォローする側
  has_many :relationships, foreign_key: :following_id
  #あるユーザーがフォローしている人全員をrelationshipsテーブルを介して持ってくる
  has_many :followings, through: :relationships, source: :follower
  #フォローされる側
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
  #あるユーザーをフォローしてくれている人全員をrelationshipsテーブルを介して持ってくる
  has_many :followers, through: :reverse_of_relationships, source: :following

  has_one_attached :profile_image

  validates :last_name, presence: true, length:{minimum: 1, maximum: 10}
  validates :first_name, presence: true, length:{minimum: 1, maximum: 10}
  validates :introduction, length: {maximum: 50}

  def get_profile_image
    (profile_image.attached?) ? profile_image : "no_image.jpg"
  end

  def followings?(following_user_id)
    #呼び出し元のインスタンス
    followings.find_by(id: following_user_id)
  end

end
