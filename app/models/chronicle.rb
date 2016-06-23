class Chronicle < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :stacks
	has_many :chronicle_bookmarks
	has_many :chronicle_categories
	# validates :reference_url, uniqueness: true, on: :create

	# before save
	# set the remote_image_url to the url contained in image

	
	# # set the remote image before saving
	# before_save do
	# 	puts "IMMMMM GONNNNNNAAAAAA SSSAAAAVE"
	# 	# binding.pry
 #    self.remote_image_url = 'http://www.eso.org/public/archives/images/screen/eso1119b.jpg'
 #  end
 #  after_save do
 #  	self.errors.each do |e|
 #  		puts e
 #  	end
 #  end

 # before_save :set_remote


	mount_uploader :image, PictureUploader
	# private
	# def set_remote
	# 	self.remote_image_url = 'http://www.eso.org/public/archives/images/screen/eso1119b.jpg'
	# end

end
