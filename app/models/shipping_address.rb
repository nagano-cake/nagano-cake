class ShippingAddress < ApplicationRecord

	belongs_to :customer

	validates :customer_id, :destination, :address, presence: true
	validates :post_code, length: {is: 7}, numericality: { only_integer: true }
end
