class Admin::TopController < ApplicationController
	def top
		@orders = Order.where("created_at >= ?", Date.today)
	end
end
