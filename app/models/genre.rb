class Genre < ApplicationRecord

	has_many :products

	validates :name
end
