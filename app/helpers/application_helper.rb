module ApplicationHelper
	def price_include_tax(price)
	  price = price * 1.1
	  "#{price.floor}"
	end

	def sub_total(price, count)
	  total = price * count
	  "#{total}円"
	end
end
