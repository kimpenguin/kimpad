class StackBookmarksController < ApplicationController
	def create
		puts "creating a bookmark"
		puts params.inspect

		@sbookmark = StackBookmark.new(user_id: current_user.id, stack_id: params[:stack_id])	
		@stack = Stack.find(params[:stack_id])
		respond_to do |format|
			if @sbookmark.save
				format.js
			else
				format.html { redirect_to :back }
			end
		end

	end

	def destroy
		puts "destroying Stack favorite"
		puts params.inspect
		if StackBookmark.exists?(stack_id: params[:id], user_id:current_user.id)
			puts "exists"
		else
			puts "doesn't exist"
		end
		@sbookmark = StackBookmark.where(stack_id: params[:id], user_id:current_user.id).first
		puts "hello #{@sbookmark}"
		puts @sbookmark
		@stack = Stack.find(@sbookmark.stack_id)
		puts @stack
		@sbookmark.destroy
		respond_to do |format|
			format.js
		end 
	end
end
