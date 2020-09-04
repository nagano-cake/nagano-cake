class Order < ApplicationRecord

	has_many :order_informations dependent: :destroy
	belongs_to :customer

	validates :customer_id, :postage, :billing, :payment_method, :name, :address, presence: true
	validates :post_code, length: {is: 7}, numericality: { only_integer: true }, presence: true

	enum status: {"入金待ち" =>0, "入金確認" =>1, "製作中" =>2, "発送準備" =>3, "発送済み" =>4}
	enum payment_method: {"クレジットカード" =>0, "銀行振り込み" =>1}
end
