class TagRelationship < ApplicationRecord
  belongs_to :shop
  belongs_to :tag
end
