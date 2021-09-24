document.addEventListener("DOMContentLoaded", function (e) {
"use_strict";



document.querySelectorAll(".delete").forEach(btn => {
    btn.addEventListener("click", () => {
      deleteProduct(btn.dataset.delete);
    });
  });

 function deleteProduct(id){
    let url = `/tp/deleteProduct/${id}`;
    window.location.href = url;
}

document.querySelectorAll(".update").forEach(btn => {
  btn.addEventListener("click", () => {
    updateProduct(btn.dataset.update, btn.dataset.description, btn.dataset.component,btn.dataset.price,btn.dataset.idbrand); //btn.dataset.description solo guarda la primer palabra
  });
});


function updateProduct(id,description,component,price,idBrand){
console.log(idBrand);
 document.querySelector("#product").value=component;
 document.querySelector("#price").value=price;
 document.querySelector("#brand").value=idBrand;
 document.querySelector("#description").value=description;

 document.querySelector("#edit-btn").addEventListener("click",()=>{
   edit(id);
  });
}
 // document.getElementById('btn-on').classList.('newclass');




function edit(id){
  
 let form =  document.querySelector(".newProduct-form");
let data = new FormData(form);

let url = `/tp/editProduct/${id}/${data.get('product')}/${data.get('description')}/${data.get('price')}/${data.get('brand')}`;
window.location.href = url;

}

// brand


document.querySelectorAll(".deleteBrand").forEach(btn => {
  btn.addEventListener("click", () => {
    deleteBrand(btn.dataset.delete);
  });
});

function deleteBrand(id){
  let url = `/tp/deleteBrand/${id}`;
  window.location.href = url;
}












});
