class DistrictsController < ApplicationController
	def index
		@stacks_all=Stack.all
		# get the last 15 stacks
		@stacks=Stack.last(15)
		# get the last 15 chronicles
		@chronicles=Chronicle.last(15)
		@chronicles_all=Chronicle.all
		@stack_contributors=StackContributor.all
	end
end
