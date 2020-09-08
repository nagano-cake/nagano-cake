class Product < ApplicationRecord
	validates :status, inclusion: {in: [true, false]}
	attachment :image

	has_many :carts_items
	has_many :order_information
	belongs_to :genre
end
