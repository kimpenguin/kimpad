module FoodnetworkHelper
	def foodnetwork(url)
		puts "INNNNNNN FOOD NETWORRRRRRRKKKKKKKK"
		puts url
		site = Nokogiri::HTML(open(url))
		title=site.css('//h1[@itemprop=name]')
		# title.text

		# empty array to be populated with ingredients and directions
		body=[]

		# ingredients
		body.push("<h3>Ingredients</h3>")
		body.push("<ul>")
		ingredients=site.css('//li[@itemprop=ingredients]')
		ingredients.each do |ingredient|
			body.push("<li>#{ingredient.text}</li>")
		end
		body.push("</ul>")

		# directions
		body.push("<h3>Directions</h3>")
		body.push("<ol>")
		directions=site.css('//ul[@class=recipe-directions-list]//li')
		directions.each do |direction|
			body.push("<li>#{direction.text}</li>")
		end
		body.push("</ol>")

		# join the ingredients and directions to fill the body
		thebody=body.join(" ")

		images=site.css("//img")
		img=""
		images.each do |image|
			if image.attr("title") == title.text
				img=image.attr('src')
			end
		end

		hash={user_id: current_user.id, reference_url: url, title:"#{title.text}", body:"#{thebody}", remote_image_url: "#{img}"}
		# hash={user_id: current_user.id, reference_url: url, title:"#{title.text}", body:"#{thebody}", image: "#{img}"}
		return hash
	end
end
