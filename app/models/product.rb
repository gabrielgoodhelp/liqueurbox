class Product < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "400x400"}
	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
	
	has_many :reviews
	validates :title, :description, :image, :producer, :producer_address, presence: true
end
