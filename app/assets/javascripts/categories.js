$(document).ready(function(){
	$(".category-stacks").on('click',function(){
		$("#category-chronicles").hide();
		$("#category-stacks").show();
	})
	$(".category-chronicles").on('click',function(){
		$("#category-stacks").hide();
		$("#category-chronicles").show();
	})
});

