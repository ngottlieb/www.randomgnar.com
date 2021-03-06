$(document).ready(function() {
	
	$(".play-button").each(function () {
		setNameVideoId($(this).attr("id"));
	});
	
	$("div#player").hide();
	
	var url_base = "http://player.vimeo.com/video/"
	
	$(".play-button").each(function() {
		$(this).click(function() {
			$("div#player iframe").attr("src", (url_base + $("a#" + $(this).attr("id")).attr("name")));
			setNameVideoId($(this).attr("id"));
			$("div#player").show();
		});
	});
});

function setNameVideoId(channel) {
	$.ajax({
	  url: ("video/" + channel),
	  success: function(data) {
	    $("a#" + channel).attr("name", data);
	  }
	}).done(function() {
		$("a#" + channel).removeClass("disabled");
	});
}

