class Order < ApplicationRecord

	has_many :order_informations dependent: :destroy
	belongs_to :customer

	validates :customer_id, :postage, :billing, :payment_method, :name, :address, presence: true
	validates :post_code, length: {is: 7}, numericality: { only_integer: true }, presence: true
	validates :

end
