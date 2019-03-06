  let list_item_1 = document.querySelector(".list-group-item");
  let list_item_2 = list_item_1.nextSibling.nextSibling;

  console.log(list_item_1);
  console.log(list_item_2);

  list_item_1.addEventListener('click', changeToActive);
  list_item_2.addEventListener('click', changeToActive);
  function changeToActive() {
    this.classList.toggle("active");
    if (this == list_item_1) {
      list_item_2.classList.toggle("active");
    } else {
      list_item_1.classList.toggle("active");
    }
  };