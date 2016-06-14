class ChroniclesController < ApplicationController
	def index
		@chronicles=Chronicle.where(user_id: current_user.id)
	end

	def new
		@chronicle=Chronicle.new
	end

	def create
		@chronicle=Chronicle.new(chronicle_params)

		# checks to see if the chronicle url exists
		if !(Chronicle.where(chronicle_url: params[:chronicle][:chronicle_url]).first && params[:chronicle][:chronicle_url]=nil)
			@chronicle.save
			redirect_to chronicle_path(@chronicle.id)
		end
	end

	def show
		@chronicle=Chronicle.find(params[:id])
	end

	# strong parameters
	private
	def chronicle_params
		params.require(:chronicle).permit(:user_id, :title, :body, :chronicle_url)
	end
end
