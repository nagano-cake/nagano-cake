class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  # validates :last_name, presence: true
  # validates :first_name, presence: true
  # validates :address, presence: true
  # validates :post_code, length: {is: 7}, numericality: { only_integer: true }#７文字の整数であるか
  # validates :telephone_number, format:/\A[0-9]+\z/, presence: true#半角数字
  # validates :first_name_kana, format: { with: /\A[ァ-ンー－]+\z/, message: "カタカナで入力して下さい。"}, presence: true
  # validates :last_name_kana, format: { with: /\A[ァ-ンー－]+\z/, message: "カタカナで入力して下さい。"}, presence: true
  #                                                                 #全角カタカナ
  enum payment: {クレジットカード:0, 銀行振込:1}

  # enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4 }

   def active_for_authentication?
     super && (self.delete_flag == true)
   end

  # validates :delete_flag, inclusion: {in: [true, false]}
      #退会ステータス
end
