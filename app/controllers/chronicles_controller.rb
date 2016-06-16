class ChroniclesController < ApplicationController
	def index
		@chronicles=Chronicle.where(user_id: current_user.id)
	end

	def new
		@chronicle=Chronicle.new
	end

	def create
		# create the new chronicle
		if params[:chronicle][:manual]=="true"
			@chronicle=Chronicle.new(chronicle_params)

			# checks to see if the chronicle url exists
			if !(Chronicle.where(chronicle_url: params[:chronicle][:chronicle_url]).first && params[:chronicle][:chronicle_url]=nil)
				@chronicle.save
				redirect_to chronicle_path(@chronicle.id)
			end
		# initiate scraping
		else
			puts "NEWWWWWWWW CHRONICLE BY URL"
			url=params[:chronicle][:reference_url]

			# goto new.js.erb
			respond_to do |format|
				@chronicle=get_parameters(url)
				puts "WELCOM BAE"
				puts @chronicle
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
		params.require(:chronicle).permit(:user_id, :title, :body, :image_url, :reference_url)
	end
end
