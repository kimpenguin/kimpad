class ChronicleBookmarksController < ApplicationController
	def create
		# puts "creating a bookmark"
		# puts params.inspect

		@cbookmark = ChronicleBookmark.new(user_id: current_user.id, chronicle_id: params[:chronicle_id])	
		@chronicle = Chronicle.find(params[:chronicle_id])
		respond_to do |format|
			if @cbookmark.save
				format.js
			else
				format.html { redirect_to :back }
			end
		end
	end

	def destroy
		puts "destroying chronicle favorite"
		puts params.inspect
		@cbookmark = ChronicleBookmark.where(chronicle_id: params[:id], user_id:current_user.id).first
		puts @cbookmark
		@chronicle = Chronicle.find(@cbookmark.chronicle_id)
		puts @chronicle
		@cbookmark.destroy
		respond_to do |format|
			format.js
		end 
	end
end
