document.addEventListener("DOMContentLoaded", function (e) {
"use_strict";



document.querySelectorAll(".delete").forEach(btn => {
    btn.addEventListener("click", () => {
      deleteProduct(btn.dataset.delete);
    });
  });


document.querySelectorAll(".update").forEach(btn => {
    btn.addEventListener("click", () => {
      updateProduct(btn.dataset.update);
    });
  });


function deleteProduct(id){
    let url = `/tp/admin/${id}`;
    window.location.href = url;
}



});
