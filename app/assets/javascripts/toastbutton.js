$(function() {
	let toastFrame = document.getElementsByClassName("iziToast-wrapper")[0];
	let closePopUpbtn = document.getElementById("close-toast-popup");

	console.log(toastFrame);
	console.log(closePopUpbtn);
	
	closePopUpbtn.addEventListener('click', closePopUP);
	function closePopUP() {
		toastFrame.classList.add("collapse");
	};
});