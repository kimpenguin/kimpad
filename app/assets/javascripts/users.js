$(document).ready(function(){


	// sticky nav
	// $(window).scroll(function () {
	// 	console.log($(window).scrollTop())
	// 	if ($(window).scrollTop() > 0) {
	// 		$('nav').addClass('navbar-fixed');
	// 	}
	// 	if ($(window).scrollTop() < 30) {
	// 		$('nav').removeClass('navbar-fixed');
	// 	}
	// });

	// toggle sidebar
	$(window).resize(function(){
		var w=$("#user-side").width();
		console.log(w)
		$('.side-button').css({"margin-left": w+'px'});
	})

	$('.side-button').click(function() {

		var w=$("#user-side").width();
		console.log(w)
    if($(this).css("margin-left") >"0px")
    {
    	console.log("hey")
    	$("#user-stacks").css({"margin-left": "2%",	"display": "block"});
    	$("#user-chronicles").css({"margin-left": "2%",	"display": "inline-block"});
        // $('#user-side').animate({"margin-left": "0px"});
        $('#user-side').toggle();
        $('.side-button').css({"margin-left": '0px'});
        $('.side-button').text(">>");
    }
    else
    {
    	// console.log("ho")
    	$("#user-stacks").css({"width": "75%", "margin-left": "23%",	"display": "block"});
    	$("#user-chronicles").css({"width": "75%", "margin-left": "23%",	"display": "inline-block"});
      $('#user-side').toggle();
      $('.side-button').css({"margin-left": '+='+w});
      $('.side-button').text("<<");
    }
  });
  // end toggle sidebar

  $(".user-stacks").on('click',function(){
    $("#us").slideDown();
    $("#uc").hide();
    $("#bks").hide();
    $(".user-stacks").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
    $(".user-chronicles").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
    $(".user-bookmarks").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
  })
  $(".user-chronicles").on('click',function(){
    $("#uc").slideDown();
    $("#us").hide();
    $("#bks").hide();
    $(".user-chronicles").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
    $(".user-stacks").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
    $(".user-bookmarks").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
  })
  $(".user-bookmarks").on('click',function(){
    $("#bks").slideDown();
    $("#us").hide();
    $("#uc").hide();
    $(".user-bookmarks").css({"background-color": "lightblue", "border-color": "lightblue", "color": "black"});
    $(".user-chronicles").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
    $(".user-stacks").css({"background-color": "darkgrey", "border-color": "darkgrey", "color": "black"});
  })

});