class Product < ApplicationRecord

	attachment :image

	has_many :carts_items
	has_many :order_informations
	belongs_to :genre

	# enum status: {販売中:0,販売停止:1}

	validates :status, inclusion: {in: [true, false]}
end
