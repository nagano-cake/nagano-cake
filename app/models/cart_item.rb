class CartItem < ApplicationRecord

	belongs_to :product
	belongs_to :customer

	validates :customer_id, :product_id, :count, presence: true
	validates :count, numericality: { only_integer: true }
end
