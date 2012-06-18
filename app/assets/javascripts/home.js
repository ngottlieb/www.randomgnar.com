$(document).ready(function() {
	$("iframe").hide();
	var url_base = "http://player.vimeo.com/video/"
	$("a#play-button").click(function() {
		$.ajax({
		  url: 'video',
		  success: function(data) {
		    $('a#play-button').attr("name", data);
		  }
		});
		
		$("iframe").attr("src", (url_base + $("a#play-button").attr("name")));
		$("iframe").show();
	});
});

