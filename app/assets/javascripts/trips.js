[].forEach.call(document.querySelectorAll('button.now'), function (el) {
	el.addEventListener('click', function (e) {
		e.preventDefault();
		console.log(el);
	});
});