class StackBookmarksController < ApplicationController
	def create
		puts "CREATEING BOOKMARK"
		puts params.inspect
		redirect_to :back

	end

	def destroy

	end
end
