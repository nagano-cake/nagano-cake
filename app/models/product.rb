class Product < ApplicationRecord
	# enum status: { 販売中: false, 販売中止: true}
	attachment :image
	has_many :carts_items
	has_many :products
	belongs_to :genre
end
