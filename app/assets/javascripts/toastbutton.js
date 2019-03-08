$(function() {
	let toastFrame = document.getElementsByClassName("iziToast-wrapper")[0];
	let closePopUpbtn = document.getElementById("close-toast-popup");
	if (toastFrame.innerHTML != null ) {
	  document.body.addEventListener('click', closePopUP)
	}
	closePopUpbtn.addEventListener('click', closePopUP);
	function closePopUP() {
		toastFrame.classList.add("collapse");
	};

});