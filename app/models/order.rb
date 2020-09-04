class Order < ApplicationRecord
	belongs_to :customer
	has_many   :order_information, dependent: :destroy
	enum status: {"入金待ち" =>0, "入金確認" =>1, "製作中" =>2, "発送準備" =>3, "発送済み" =>4}
	enum payment_method: {"クレヒットカード" =>0, "銀行振り込み" =>1}
end
