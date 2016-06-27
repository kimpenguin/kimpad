$(document).ready(function(){
	$(".category-stacks").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
	$(".category-stacks").on('click',function(){
		$("#category-chronicles").hide();
		$("#category-stacks").show();
		$(".category-stacks").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
    $(".category-chronicles").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
	})
	$(".category-chronicles").on('click',function(){
		$("#category-stacks").hide();
		$("#category-chronicles").show();
		$(".category-chronicles").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
    $(".category-stacks").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
	})
});

