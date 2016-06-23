class DistrictsController < ApplicationController
	def index
		@stacks=Stack.all
		@chronicles=Chronicle.all
		@stack_contributors=StackContributor.all
	end
end
