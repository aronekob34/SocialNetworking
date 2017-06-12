$(document).on('ready page:load', function() {

	$("#leftSignup").hide();
	$("#leftDescription").hide();
	$("#rightSignup").hide();
	$("#rightDescription").hide();

	$('#signupFacebookButton').mouseover(function(){
		var $this = $(this);
		if (!$this.is(":animated"))
			$(this).effect("bounce", { times: 5 }, 2000);
	});

	if ($(window).width() < 425) {
		$("#signupFacebookButton").click(function() {
			$(this).stop(true, true).hide("scale", 600, function() {
					$("#leftDescription").show(); 
					$("#rightDescription").show();
			});
		});
	}
	else {
		$("#signupFacebookButton").click(function() {
			$(this).stop(true, true).hide("scale", 600, function() {
					$("#leftDescription").show("bounce", {times: 5 }, 2000);
					$("#rightDescription").show("bounce", {times: 5 }, 2000);
			});
		});
	}

	$(function() {
		$("#leftDescription").hover(function(){
			$("#leftDesc").dequeue().stop(false, true).show("blind", "slow");
		}, function(){
			$('#leftDesc').dequeue().stop(false, true).hide("blind", "slow");
			});
	});
	
	$(function() {
		$("#rightDescription").hover(function(){
			$("#rightDesc").dequeue().stop(false, true).show("blind", "slow");
		}, function(){
			$('#rightDesc').dequeue().stop(false, true).hide("blind", "slow");
			});
	});	 	
});

window.addEventListener("load", function(){
window.cookieconsent.initialise({
  "palette": {
    "popup": {
      "background": "#000"
    },
    "button": {
      "background": "#f1d600"
    }
  }
})});