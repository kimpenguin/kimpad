$(document).ready(function(){
	// change the size of the chronicle box on click
	$(".main2").on("click",function(){
		console.log('hi')
		var val=$(this).data("target");
		var cnum=val.split('-');
		var i=cnum[2];
		console.log(".main-text"+i)
		$(".main-text-"+i).css({"overflow": "visible"});
		var n=$(".main-text-"+i).text().split("\n").length * 24;
		// console.log(n)
		$(val).css({"height": n+"px"});
		// $(".main-text-"+i).append('<button style="width:20%; margin-left:30%;z-index:100000;" class="main-up" data-target=".main-inner-'+i+'"><i class="fa fa-angle-up" aria-hidden="true"></i></button>');
		$(".main-inner-"+i).css({"background-color": "lightgray"})
	});
	// $(".main-up").on("click",function(){
	// 	var val=$(this).data("target");
	// 	var cnum=val.split('-');
	// 	var i=cnum[2];
	// 	// console.log(".main-text"+i)
	// 	$(".main-text-"+i).css({"overflow": "hidden"});
	// 	$(val).css({"height": "200px"});
	// });

	$("#add_new").on('click',function(){
		// console.log('hey')
		$(".new-category-name").show();
	})
})
