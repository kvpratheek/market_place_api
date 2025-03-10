class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :published, :user_id
  belongs_to :user
end
