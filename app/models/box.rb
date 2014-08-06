class Box < ActiveRecord::Base
	has_attached_file :image, :styles => { :large => "800x800", :medium => "400x400"}
	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

	has_many :orders
end
