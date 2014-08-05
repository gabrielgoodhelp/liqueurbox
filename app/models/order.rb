class Order < ActiveRecord::Base
	validates :address, :city, :state, :province, :ZIP_code, presence: true
	belongs_to :box
end
