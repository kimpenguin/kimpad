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
end
