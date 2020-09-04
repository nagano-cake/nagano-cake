class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :last_name, :first_name, :address, presence: true
  validates :post_code, length: {is: 7}, numericality: { only_integer: true }
  #７文字の整数であるか
  validates :phone_number, format:/\A[0-9]+\z/, presence: true
  									#半角数字
  validates :kana_first_name, :kana_last_name, format: { with: /^[ァ-ンー－]+$/, message: "カタカナで入力して下さい。"}, presence: true
  																　#全角カタカナ
  enum payment: {クレジットカード:0, 銀行振込:1}

  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4 }

end
