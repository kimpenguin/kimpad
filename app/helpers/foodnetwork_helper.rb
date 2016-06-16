require "nokogiri"
require 'open-uri'
module FoodnetworkHelper
	def foodnetwork(url)
		puts "INNNNNNN FOOD NETWORRRRRRRKKKKKKKK"
		site = Nokogiri::HTML(open(url))
		title=site.css('//h1[@itemprop=name]')
		# title.text

		# ingredients
		body=[]
		body.push("<h3>Ingredients</h3>")
		ingredients=site.css('//li[@itemprop=ingredients]')
		ingredients.each do |ingredient|
			body.push(ingredient.text)
		end

		body.push("<h3>Directions</h3>")
		directions=site.css('//ul[@class=recipe-directions-list]//li')
		directions.each do |direction|
			body.push(direction.text)
		end

		thebody=body.join(" ")

		images=site.css("//img")
		img=""
		images.each do |image|
			if image.attr("title") == title.text
				img=image.attr('src')
			end
		end

		hash={user_id: current_user.id, reference_url: url, title:"#{title.text}", body:"#{thebody}", image_url: "#{img}"}
		return hash
	end
end
