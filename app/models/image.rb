class Image < ActiveRecord::Base
	has_attached_file :image, 
					  :styles => {:thumb => "200x100#",
      							  :small  => "400x200>",
      							  :medium => "600x300" },
  					  :path => ":rails_root/public/upload_images/:basename.:extension",
  					  :url => "/upload_images/:basename.:extension"
  	validates_attachment :image, :presence => true,
  						 :content_type => { :content_type => /\Aimage\/.*\Z/ },
  						 :size => { :in => 0..200.kilobytes }
end
