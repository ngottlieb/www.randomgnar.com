$(document).ready(function() {
	setNameVideoId();
	$("iframe").hide();
	var url_base = "http://player.vimeo.com/video/"
	$("a#play-button").click(function() {
		setNameVideoId();
		
		$("iframe").attr("src", (url_base + $("a#play-button").attr("name")));
		$("iframe").show();
	});
});

function setNameVideoId() {
	$.ajax({
	  url: 'video',
	  success: function(data) {
	    $('a#play-button').attr("name", data);
	  }
	});
}

