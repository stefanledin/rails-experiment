[].forEach.call(document.querySelectorAll('button.now'), function (el) {
	el.addEventListener('click', function (e) {
		e.preventDefault();
		var textField = document.querySelector('input#'+this.dataset.now),
		t = new Date(),
		hour = (t.getHours() < 10) ? '0' + t.getHours() : t.getHours();
		minutes = (t.getMinutes() < 10) ? '0' + t.getMinutes() : t.getMinutes();
		textField.value=hour+':'+minutes;
	});
});