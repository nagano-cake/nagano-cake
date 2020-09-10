class CartItem < ApplicationRecord

	belongs_to :product
	belongs_to :customer

	validates :customer_id, :product_id, :count, presence: true
	validates :count, numericality: { only_integer: true }

    # 金額計算(小計)
	def shoukei
		cart_item.product.price*cart_item.count
	end

	def goukei
		sum=0
			cart_item.shoukei.each do |shoukei|
			sum += cart_item.shoukei
			end
		sum
	end
end
