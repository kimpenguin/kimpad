class CategoriesController < ApplicationController
	def show
		@category=Category.find(params[:id])
		@chronicles=ChronicleCategory.where(category_id:params[:id])
		@stacks=StackCategory.where(category_id:params[:id])
	end

end
