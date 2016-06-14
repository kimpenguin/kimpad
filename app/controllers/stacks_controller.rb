class StacksController < ApplicationController

	def index
		@user_stacks=Stack.where(user_id: current_user.id)
	end

	def show
		# @chronicles=Chronicle.all
		@stack=Stack.find(params[:id])
		@chronicles=@stack.chronicles
	end

	def new
		@stack=Stack.new
	end

	def create
		@stack=Stack.new(stack_params)

		# if the category doesn't already exist, create it
		if !Stack.where(stack_name: params[:stack][:stack_name], user_id: params[:stack][:user_id]).first
			@stack.save
			redirect_to stack_path(@stack.id)
		end
		redirect_to user_path(current_user.id)
	end

	# strong parameters
	private
	def stack_params
		params.require(:stack).permit(:stack_name, :user_id)
	end

end
