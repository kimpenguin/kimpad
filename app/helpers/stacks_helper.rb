module StacksHelper
	def add_stack_contributors
		puts "ADDING CONTRIBUTORS"
		contributors=params[:users]
		puts "the contributors are #{contributors}"
		contributors.each do |c|
			StackContributor.create(stack_id:@stack.id, user_id:c)
		end
	end

	# updates the stack contributors in the database
	def update_stack_contributors
		puts "updating contributors"
		contributors=params[:users]
		# binding.pry

		db_contributors=StackContributor.where(stack_id:@stack.id)
		# puts "in the database count:"
		# puts db_contributors.count
		# puts "number of contributors count:"
		# puts contributors.count


		# if the user chooses to have no contributors, delete the existing contributors in the database
		if contributors.nil?
			if db_contributors.count>0
				db_contributors.each do |rm|
					if rm.user_id!=current_user.id
						puts "to remove:"
						puts rm
						StackContributor.where(stack_id: @stack.id, user_id: rm.user_id).first.destroy
					else
						puts "don't remove the owner"
						puts rm.user_id
					end
				end
			end
		end

		# if the number of contributors is greater than the ones in the database, add the new ones
		if contributors.count>db_contributors.count
			# add new contributors
			contributors.each do |sc|
				if StackContributor.exists?(stack_id: @stack.id, user_id: sc)
					puts "The following user exists. Will not add:"
					puts sc
				else
					# create new stackcontributor
					puts "This user doesn't exist, so we'll add:"
					puts sc
					StackContributor.create(stack_id: @stack.id, user_id: sc)
				end
			end
		end

		# if the number of contributors is less than the ones in the database, remove the ones that were not included
		if !contributors.nil? && contributors.count<db_contributors.count
			puts "remove contributors that the user no longer wants to include"
			# if the db contributors doe not exist in new contributors list, then, remove them
			db_arr=db_contributors.pluck(:user_id)
			puts "starter array #{db_arr}"
			# puts new_ar
			puts "from user #{contributors}"

			contributors.each do |c|
				db_arr.each do |db|
					if db==c.to_i
						puts "not removing #{db} because #{c}"
					else
						# removing this user as stack contributor
						puts "removing #{db}"
						StackContributor.where(stack_id: @stack.id, user_id: db).first.destroy
					end 
				end
			end
		end
	end


	def add_stack_categories
		puts "adding categories"
		cats=params[:categories]
		puts "the categories are #{cats}"
		cats.each do |c|
			StackCategory.create(stack_id:@stack.id, category_id:c)
		end

	end

	def update_stack_categories
		puts "updating categories"
		# puts params.inspect
		cat_arr=params[:categories]
		cat_str=params[:new_cat]
		db_cat=StackCategory.where(stack_id:@stack.id)


		# if user adds new categories in input field
		if cat_str.length>0
			puts "adding #{cat_str}"
			# split the string by commas
			new_arr=cat_str.split(",")
			new_arr.each do |n|
				# check if the category exists
				if Category.exists?(category_name:n)
					puts "the category exists, so add to StackCategory"
					nc=Category.where(category_name:n)
					# checks if the category exists for the stack; adds if doesn't exist
					if StackCategory.exists?(stack_id:@stack.id, category_id:nc.id)
						puts "category exists for this stack"
					else
						dbc=Category.where(category_name:n).first
						StackCategory.create(stack_id:@stack.id,category_id:dbc.id)
					end
				else
					#adds the category and adds the category to the stack
					nc=Category.create(category_name:n)
					StackCategory.create(stack_id:@stack.id,category_id:nc.id)
				end
			end
		end


		# if the user chooses to have no categories, remove from database
		if cat_arr.nil?
			if db_cat.count>0
				db_cat.each do |rm|
					StackCategory.find(rm.id).destroy
				end
			end
		end

		# if the number of contributors is greater than the ones in the database, add the new ones
		if cat_arr.count>db_cat.count
			# add new contributors
			cat_arr.each do |sc|
				if StackCategory.exists?(stack_id: @stack.id, category_id: sc)
					puts "The following category exists. Will not add:"
					puts sc
				else
					# create new stackcontributor
					puts "This category doesn't exist, so we'll add:"
					puts sc
					StackCategory.create(stack_id: @stack.id, category_id: sc)
				end
			end
		end

		# if the number of contributors is less than the ones in the database, remove the ones that were not included
		if !cat_arr.nil? && cat_arr.count<db_cat.count && cat_str.length==0
			puts "remove categories that the user no longer wants to include"
			# if the db contributors doe not exist in new contributors list, then, remove them
			db_arr=db_cat.pluck(:category_id)
			puts "starter array #{db_arr}"
			# puts new_ar
			puts "from user #{cat_arr}"

			# cat_arr.each do |c|
				db_arr.each do |db|
					if cat_arr.include? db.to_s
						puts "match #{db} is in #{cat_arr}"
					else
						puts "to remove #{db} because #{cat_arr}"
						StackCategory.where(stack_id:@stack.id, category_id:db).first.destroy
					end
				end
			# end
		end

		if  cat_arr.count==db_cat.count
			puts "Yayyyy"
		end
	end

end
