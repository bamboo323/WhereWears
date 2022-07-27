class Genre < ApplicationRecord

  belongs_to :admin, optional: true
  has_many :shops

  validates :name, presence:true
end
