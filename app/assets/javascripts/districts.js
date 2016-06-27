$(document).ready(function(){
	
	$('#district-not-loggedin').hide();
	$('#nav').hide();
	$('#landing').show();
	$('.landing-box').show();
	// $(".arrow-left").hide();
	// $(".arrow-right").hide();

	// toggle login form
	$('#landing-log-button').on('click',function(){
		$('#landing-log-button').text("Enter Info")
		$('.landing-form').toggle(300)
	})

	// show the district if the visitor chooses to explore
	$('#landing-log-button2').on('click',function(){
		$('#district-not-loggedin').show();
		$('#nav').show();
		$('#landing').fadeOut(3000);
		$('.landing-box').fadeOut(3000);
		$(".arrow-left").hide().fadeIn(3000);
		$(".arrow-right").hide().fadeIn(3000);
		
		$('#logo-nl').on('click',function(){
			location.reload();
		});

	})

	// determines page width
	function pageWidth(){
		var pix=window.innerWidth;
		return pix;
	}
	// #####################################
	// arrows for scroll - stack

	$(".arrow-left").click(function(){
		var boxwidth=pageWidth();
    $(".stack-box").animate({scrollLeft: "-="+boxwidth});
  });
  $(".arrow-right").click(function(){
		var boxwidth=pageWidth();
    $(".stack-box").animate({scrollLeft: "+="+boxwidth});
  });  
	// #####################################
	// arrows for scroll - chronicle
	$(".arrow-left2").click(function(){
		var boxwidth=pageWidth();
    $(".chronicle-box").animate({scrollLeft: "-="+boxwidth});
  });
  $(".arrow-right2").click(function(){
		var boxwidth=pageWidth();
    $(".chronicle-box").animate({scrollLeft: "+="+boxwidth});
  });  

  $(".district-featured").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});

 $(".district-stacks").on('click',function(){
  $("#ds").slideDown(500);
  $("#dc").hide();
  $("#df").hide();
  $(".district-stacks").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
  $(".district-chronicles").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
  $(".district-featured").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});

  })
  $(".district-chronicles").on('click',function(){
    $("#ds").hide();
    $("#dc").slideDown(500);
    $("#df").hide();
    $(".district-chronicles").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
    $(".district-stacks").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
    $(".district-featured").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
  })
  $(".district-featured").on('click',function(){
    $("#ds").hide();
    $("#dc").hide();
    $("#df").slideDown(500);
    $(".district-featured").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
    $(".district-chronicles").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
    $(".district-stacks").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
  })

});