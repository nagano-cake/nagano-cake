class Genre < ApplicationRecord
	# enum vaild_flag: { 無効: false, 有効: true}
	has_many :products
	validates :vaild_flag, inclusion: {in: [true, false]}
end
