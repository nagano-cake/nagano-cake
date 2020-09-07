class Product < ApplicationRecord
	validates :status, inclusion: {in: [販売中止: true, 販売中: false]}
	attachment :image

	has_many :carts_items
	has_many :order_information
	belongs_to :genre
end
