class ChroniclesController < ApplicationController

	def index
		@chronicles=Chronicle.where(user_id: current_user.id)
	end

	def new
		@chronicle=Chronicle.new
		@stacks=Stack.where(user_id:current_user.id)
		@stack=Stack.new

		# categories
		@categories=Category.all #all
		@chronicles=Chronicle.where(user_id:current_user.id) #by user

	end

	def create
		puts "creating"
		puts params.inspect
		# add_categories
		# redirect_to :back
		

		if params[:chronicle][:manual]=="true"
			@chronicle=Chronicle.new(chronicle_params)

			puts "HELLLLLLOOOO URL PLEASE PASTE"
			puts params[:chronicle][:image]
			# checks to see if the chronicle url exists
			if !(Chronicle.where(reference_url: params[:chronicle][:reference_url]).first && params[:chronicle][:reference_url]=nil)
					@chronicle.save!
					add_chronicle_categories #add the categories
					add_chronicle_stacks #add stackchronicle
					# puts @chronicle.image.url # => '/url/to/file.png'
					# puts @chronicle.image.current_path # => 'path/to/file.png'
					# puts @chronicle.image_identifier # => 'file.png'
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
				add_chronicle_categories #add the categories
				add_chronicle_stacks #add stackchronicle
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
				@stacks=Stack.where(user_id:current_user.id)
				@chronicles=Chronicle.where(user_id:current_user.id) #by user
				@chronicle=Chronicle.new(get_parameters(url))
				@categories=Category.all
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

	def edit
		@chronicle=Chronicle.find(params[:id])
		@categories=Category.all
		@chronicle_categories=ChronicleCategory.where(chronicle_id:params[:id])
		@chronicles=Chronicle.where(user_id:current_user.id) #by user
		@stacks=Stack.where(user_id:current_user.id)
		@stack_chronicles=StackChronicle.where(chronicle_id:params[:id])
	end

	def update
		@chronicle=Chronicle.find(params[:id])

		# redirect_to :back
		if @chronicle.update_attributes(chronicle_params)
			update_chronicle_categories
			update_chronicle_stacks
			flash[:notice] = "The post has been updated."
			redirect_to chronicle_path(@chronicle.id)
		else
			flash[:alert] = "Sorry! There was an error."
			redirect_to :back
		end
	end

	def destroy
		puts "in destroy chronicle"
		@chronicle=Chronicle.find(params[:id])
		@stack_chronicles=StackChronicle.where(chronicle_id:params[:id])
		@chronicle_bookmarks=ChronicleBookmark.where(chronicle_id:params[:id])
		@chronicle_categories=ChronicleCategory.where(chronicle_id:params[:id])
		@stack_chronicles.destroy_all
		@chronicle_bookmarks.destroy_all
		@chronicle_categories.destroy_all
		@chronicle.destroy
		# check chronicle_id:2
		redirect_to user_path(current_user.id)
	end

	# strong parameters
	private
	def chronicle_params
		params.require(:chronicle).permit(:user_id, :title, :body, :image, :reference_url, :unfiled, :remote_image_url)
	end
end
