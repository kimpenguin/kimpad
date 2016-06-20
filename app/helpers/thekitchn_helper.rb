module ThekitchnHelper
	# def thekitchn(url)
	# 	puts "IN THEKITCHN"
	# 	site = Nokogiri::HTML(open(rs_url))
	# 	title=site.css('//h1[@itemprop=name]')
	# 	# title.text

	# 	desc=site.css('//meta[@name="description"]')
	# 	desc.attr('content')

		
	# 	images=site.css("//div[@class=typeset--longform]//div[@class=PostPicture__picture]//div")
	# 	images.each do |image|
	# 		images.attr("data-props")<br>
	# 	end

	# 	<h3>Ingredients</h3>
	# 	ingredients=site.css('//ol[@class=ingredient-list]//li//span')
	# 	count=0
	# 	ingredients.each do |ingredient|
	# 		if !(count==0 || count%3==0)
	# 			ingredient.text 
	# 		else
	# 			<br>
	# 		end
	# 		count=count+1
	# 	end

	# 	<h3>Directions</h3>
	# 	directions=site.css('//section[@itemprop=recipeInstructions]//li')
	# 	directions.each do |direction|
	# 		direction.text<br><br>
	# 	end
end
