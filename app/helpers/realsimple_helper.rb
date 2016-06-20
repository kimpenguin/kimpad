module RealsimpleHelper
	def realsimple(url)
		puts "IN REAL SIMPLLLLLEEEEEEEEEEE"
		site = Nokogiri::HTML(open(url))

		# title
		title=site.css('//h1[@itemprop=name]')


		# empty array to be populated with ingredients and directions
		body=[]

		# ingredients
		body.push("<h3>Ingredients</h3>")
		body.push("<ul>")
		ingredients=site.css('//ol[@class=ingredient-list]//li//span')
		count=0
		ingredients.each do |ingredient|
			if !(count==0 || count%3==0)
				body.push("<li>#{ingredient.text}</li>")
			end
			count=count+1
		end
		body.push("</ul>")

		# directions
		body.push("<h3>Directions</h3>")
		body.push("<ol>")
		directions=site.css('//section[@itemprop=recipeInstructions]//li')
		directions.each do |direction|
			body.push("<li>#{direction.text}</li>")
		end
		body.push("</ol>")

		# join the ingredients and directions to fill the body
		thebody=body.join(" ")
	
		img=""
		images=site.css("//img[@itemprop=image]")
		img=images[0].attr('src')

		hash={user_id: current_user.id, reference_url: url, title:"#{title.text}", body:"#{thebody}", remote_image_url: "#{img}"}
		# hash={user_id: current_user.id, reference_url: url, title:"#{title.text}", body:"#{thebody}", image: "#{img}"}
		return hash
	end

end
