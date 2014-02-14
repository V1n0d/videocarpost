//= require plugins/jquery.mousewheel
//= require plugins/jquery.touchSwipe.min
//= require plugins/carousel

// var new_jq = $.noConflict(true);
$(document).ready(function() {
	
		$('#foo').carouFredSel({
			auto:false,
			responsive: true,
			width: '100%',
			scroll: 2,
			mousewheel: true,
			swipe: {
				onMouse: true,
				onTouch: true
			},
			items: {
				width: 400,
					visible: {
						min: 1,
						max: 6
					}
				},
				prev: '#prev',
				next: '#next'
			});

	});
