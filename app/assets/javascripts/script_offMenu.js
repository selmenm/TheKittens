const $cartOffMenu = $(document.querySelectorAll("ul.d-inline-block > li")[2]);
const $cartOnMenu = $(document.querySelector(".is-triggered"));
$(document).ready(function(){

  $cartOffMenu.on('click', () =>{

    $cartOnMenu.show();
  });
});