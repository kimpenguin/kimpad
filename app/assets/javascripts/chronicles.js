$(document).ready(function(){
	// alert('hi')
	$(".manual").on('click', function(){
		$("#manual-chronicle").show();
		$("#url-chronicle").hide();
		$(".url-rendered").hide();
	});
	$(".url").on('click', function(){
		console.log("i'm here");
		$("#url-chronicle").show();
		$(".url-rendered").show();
		$("#manual-chronicle").hide();
	});
	$(".btn-render").on('click', function(){
		$(this).prop("disabled",true);
		$(".btn-render").fadeOut();
	});
})