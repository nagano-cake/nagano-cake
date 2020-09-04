class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum delete_flag: { withdraw: false, validity: true}
  #退会ステータス
  has_many :orders, dependent: :destroy
end
