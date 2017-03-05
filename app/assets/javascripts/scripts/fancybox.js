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
		openEffect	: 'elastic',
		closeEffect	: 'elastic'
	});
}
