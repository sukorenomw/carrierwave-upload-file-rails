class Image < ActiveRecord::Base
	has_attached_file :image, 
					  :styles => {:thumb => "200x100>"},
					  :default_style => :thumb,
  					  :path => ":rails_root/public/upload_images/:basename.:extension"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
