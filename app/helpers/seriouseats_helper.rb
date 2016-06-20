module SeriouseatsHelper
	def seriouseats(url)
		site = Nokogiri::HTML(open(url))

		title=site.css('//header[@class=entry-header]//h1')

		# empty array to be populated with ingredients and directions
		body=[]

		# ingredients
		body.push("<h3>Ingredients</h3>")
		body.push("<ul>")
		ingredients=site.css('//div[@class=recipe-ingredients]//li')
		ingredients.each do |ingredient|
			body.push("<li>#{ingredient.text}</li>")
		end
		body.push("</ul>")

		# directions
		body.push("<h3>Directions</h3>")
		body.push("<ol>")
		directions=site.css('//div[@class=recipe-procedure-text]//p')
		directions.each do |direction|
			body.push("<li>#{direction.text}</li>")
		end
		body.push("</ol>")

		# join the ingredients and directions to fill the body
		thebody=body.join(" ")

		img=""
		images=site.css("//img")
		images.each do |image|
			if image.attr("alt") == title.text
				img=image.attr('src')
			end
		end

		hash={user_id: current_user.id, reference_url: url, title:"#{title.text}", body:"#{thebody}", remote_image_url: "#{img}"}
		# hash={user_id: current_user.id, reference_url: url, title:"#{title.text}", body:"#{thebody}", image: "#{img}"}
		return hash
	end
end
