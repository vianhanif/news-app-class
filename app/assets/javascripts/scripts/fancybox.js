function fancybox(){
  $(".fancybox-thumb").fancybox({
		prevEffect	: 'none',
		nextEffect	: 'none',
    closeBtn		: false,
		helpers	: {
			title	: {
				type: 'inside'
			},
			thumbs	: {
				width	: 80,
				height	: 80
			}
		}
	});
  $(".various").fancybox({
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});
}
