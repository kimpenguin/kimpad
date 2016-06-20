class ChroniclesController < ApplicationController

	def index
		@chronicles=Chronicle.where(user_id: current_user.id)
	end

	def new
		@chronicle=Chronicle.new
		@stacks=Stack.where(user_id:current_user.id)
		@stack=Stack.new
	end

	def create
		# create the new chronicle
		if params[:chronicle][:manual]=="true"
			# @chronicle=Chronicle.new(chronicle_params)
			@chronicle=Chronicle.new(chronicle_params)
			# binding.pry

			puts "HELLLLLLOOOO URL PLEASE PASTE"
			puts params[:chronicle][:image]
			# checks to see if the chronicle url exists
			if !(Chronicle.where(reference_url: params[:chronicle][:reference_url]).first && params[:chronicle][:reference_url]=nil)
					@chronicle.save!
					puts @chronicle.image.url # => '/url/to/file.png'
					puts @chronicle.image.current_path # => 'path/to/file.png'
					puts @chronicle.image_identifier # => 'file.png'
					redirect_to chronicle_path(@chronicle.id)
			end

		# download the image from url
		elsif params[:chronicle][:manual]=="from-remote"
			@chronicle=Chronicle.new(chronicle_params)
			# @chronicle.image="hello"

			puts "IM IN REMOTEEEEEEEE"
			puts params[:chronicle][:remote_image_url]
			puts "WAAAAT"
			puts @chronicle.image
			if @chronicle.save
				redirect_to chronicle_path(@chronicle.id)
			else
				flash[:alert] = "Sorry! The post exists."
				redirect_to new_chronicle_path
			end
		# initiate scraping
		else
			puts "NEWWWWWWWW CHRONICLE BY URL"
			url=params[:chronicle][:reference_url]

			# goto new.js.erb
			respond_to do |format|
				@chronicle=Chronicle.new(get_parameters(url))
				puts "WELCOM BACK"
				puts @chronicle.title
				puts @chronicle.body
				puts "REMOTE"
				puts @chronicle.image
				puts @chronicle.title
				# scrape
				# format.html 
        format.js
		  end
		end
	end

	def show
		@chronicle=Chronicle.find(params[:id])
	end

	# strong parameters
	private
	def chronicle_params
		params.require(:chronicle).permit(:user_id, :title, :body, :image, :reference_url, :remote_image_url)
	end
end
