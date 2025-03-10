class Product < ApplicationRecord
  belongs_to :user
  validates_numericality_of :price, greater_than: 0
  validates_presence_of :user_id, :title
end
