module ChroniclesHelper
	def get_parameters(url)
		# hash of websites
		websites={foodnetwork:"http://www.foodnetwork.com", thekitchn:"http://www.thekitchn.com", realsimple:"http://www.realsimple.com", allrecipes:"http://allrecipes.com",seriouseats:"http://www.seriouseats.com"}
		
		websites.keys.each_with_index do |key, index|
			value = websites[key]
			if url.match(/.*\.com/)[0] == value
				# Chronicle.new(send("#{key}('#{url}')"))
				# puts "WAHHHHHHHHH"
				# puts key
				# myhash=foodnetwork(url)
				# puts myhash

				# consider returning just the hash and creating back in the controller
				# return Chronicle.new(foodnetwork(url))
				# return foodnetwork(url)
				return send("#{key}","#{url}")

				# return Chronicle.new(user_id:current_user.id, title: send("#{key}_title('#{url}')"), body: send("#{key}_body('#{url}')"), image: send("#{key}_image('#{url}')"), reference_url: url)
				# arr.each do |n|
				# 	md="#{key}_#{n}('#{url}')"
				# 	puts md
				# end
			end
		end
	end

	def add_chronicle_categories
		puts "in add categories"
		categories=params[:categories]
		cat_str=params[:new_cat]
		puts "new cats #{cat_str}"
		new_arr=cat_str.split(",")
		
		# add the chroniclecategory
		if !categories.nil?
			categories.each do |c|
				ChronicleCategory.create(chronicle_id:@chronicle.id, category_id:c)
			end
		end

		# add the categories entered in input field
		if !new_arr.nil?
			new_arr.each do |nc|
				# if the category doesn't already exist, create it
				if Category.exists?(category_name:nc)
					new_cat=Category.where(category_name:nc).first
					ChronicleCategory.create(chronicle_id:@chronicle.id, category_id:new_cat.id)
				else
					new_cat=Category.create(category_name:nc)
					ChronicleCategory.create(chronicle_id:@chronicle.id, category_id:new_cat.id)
				end
			end
		end
	end

	def update_chronicle_categories
		puts "in update categories"
		cat_arr=params[:categories]
		cat_str=params[:new_cat]
		db_cat=ChronicleCategory.where(chronicle_id:@chronicle.id)


		# if user adds new categories in input field
		if cat_str.length>0
			puts "adding #{cat_str}"
			# split the string by commas
			new_arr=cat_str.split(",")
			new_arr.each do |n|
				# check if the category exists
				if Category.exists?(category_name:n)
					puts "the category exists, so add to ChronicleCategory"
					nc=Category.where(category_name:n)
					# checks if the category exists for the chronicle; adds if doesn't exist
					if ChronicleCategory.exists?(chronicle_id:@chronicle.id, category_id:nc.id)
						puts "category exists for this stack"
					else
						dbc=Category.where(category_name:n).first
						ChronicleCategory.create(chronicle_id:@chronicle.id,category_id:dbc.id)
					end
				else
					#adds the category and adds the category to the chronicle
					if Category.create(category_name:n)
						nc2=Category.where(category_name:n).first
						puts "Why am i not saving?"
						ChronicleCategory.create(chronicle_id:@chronicle.id,category_id:nc2.id)
					end
				end
			end
		end


		# if the user chooses to have no categories, remove from database
		if cat_arr.nil?
			if db_cat.count>0
				db_cat.each do |rm|
					ChronicleCategory.find(rm.id).destroy
				end
			end
		end

		# if the number of contributors is greater than the ones in the database, add the new ones
		if cat_arr.count>db_cat.count
			# add new contributors
			cat_arr.each do |cc|
				if ChronicleCategory.exists?(chronicle_id: @chronicle.id, category_id: cc)
					puts "The following category exists. Will not add:"
					puts cc
				else
					# create new stackcontributor
					puts "This category doesn't exist, so we'll add:"
					puts cc
					ChronicleCategory.create(chronicle_id: @chronicle.id, category_id: cc)
				end
			end
		end

		# if the number of contributors is less than the ones in the database, remove the ones that were not included
		if !cat_arr.nil? && cat_arr.count<db_cat.count &&cat_str.length==0
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
						ChronicleCategory.where(chronicle_id:@chronicle.id, category_id:db).first.destroy
					end
				end
			# end
		end

		if  cat_arr.count==db_cat.count
			puts "Yayyyy"
		end



	end
end
