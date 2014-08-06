class Order < ActiveRecord::Base
	validates :address, :city, :state, :province, :ZIP_code, presence: true
	belongs_to :box
	belongs_to :user
end

