$(document).ready(function(){
	// alert("check first visit")
	// $('#district').hide();
	$('#district-not-loggedin').hide();
	$('#nav').hide();
	$('#landing').show();
	$('.landing-box').show();
	$(".arrow-left").hide();
	$(".arrow-right").hide();

	// toggle login form
	$('#landing-log-button').on('click',function(){
		$('#landing-log-button').text("Enter Info")
		$('.landing-form').toggle(1000)
	})

	// show the district if the visitor chooses to explore
	$('#landing-log-button2').on('click',function(){
		$('#district-not-loggedin').show();
		$('#nav').show();
		$('#logo-nl').on('click',function(){
			location.reload();
		});

		$('#landing').fadeOut(3000);
		$('.landing-box').fadeOut(3000);
		$(".arrow-left").fadeIn(3000);
	$(".arrow-right").fadeIn(3000);
	})

	// #####################################
	// arrows for scroll - stack
	$(".arrow-left").click(function(){
      $(".stack-box").animate({scrollLeft: "-="+100});
  });
  $(".arrow-right").click(function(){
      $(".stack-box").animate({scrollLeft: "+="+100});
  });  
	// #####################################
	// arrows for scroll - chronicle
	$(".arrow-left2").click(function(){
      $(".chronicle-box").animate({scrollLeft: "-="+100});
  });
  $(".arrow-right2").click(function(){
      $(".chronicle-box").animate({scrollLeft: "+="+100});
  });  

});