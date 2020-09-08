class CartItem < ApplicationRecord

	belongs_to :product
	belongs_to :customer

	validates :customer_id, :product_id, :count, presence: true
	validates :count, numericality: { only_integer: true }

    # 金額計算(小計)
	def subtotal_price
		(count * product.price * Constants::TAX).round
	end

end
