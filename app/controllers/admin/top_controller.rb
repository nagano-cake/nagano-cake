class Admin::TopController < ApplicationController
	# before_action :authenticate_admin!
	def top
		@orders = Order.where("created_at >= ?", Date.today)
	end
end
