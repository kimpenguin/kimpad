class DistrictsController < ApplicationController
	def index
		@stacks=Stack.all
		@chronicles=Chronicle.all
	end
end
