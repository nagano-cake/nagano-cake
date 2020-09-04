class OrderInformation < ApplicationRecord
	enum status: {"着手不可" =>0, "製作待ち" =>1, "製作中" =>2, "製作完了" =>3}
	belongs_to :order

	def shoukei
		order_informations.price*order_informations.count
	end

	def goukei
		sum=0
			@order_informations.shoukei.each do |shoukei|
			sum += order_informations.shoukei
			end
		sum
	end
end

