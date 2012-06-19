$(document).ready(function() {
	setNameVideoId();
	$("#player").hide();
	var url_base = "http://player.vimeo.com/video/"
	$("a#play-button").click(function() {
		$("iframe").attr("src", (url_base + $("a#play-button").attr("name")));
		setNameVideoId();
		$("#player").show();
	});
});

function setNameVideoId() {
	$.ajax({
	  url: 'video',
	  success: function(data) {
	    $('a#play-button').attr("name", data);
	  }
	}).done(function() {
		$('a#play-button').removeClass("disabled");
	});
}

