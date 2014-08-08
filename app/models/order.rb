class Order < ActiveRecord::Base
	validates :address, :city, :state, :province, :ZIP_code, :phone_number, presence: true
	validates :ZIP_code, numericality: {
		only_integer: true
	}
	validates :phone_number, numericality: {
		only_integer: true
	}
	belongs_to :box
	belongs_to :user
end

