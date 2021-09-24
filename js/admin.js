document.addEventListener("DOMContentLoaded", function (e) {
  "use_strict";



  document.querySelectorAll(".delete-product").forEach(btn => {
    btn.addEventListener("click", () => {
      deleteProduct(btn.dataset.delete);
    });
  });

  function deleteProduct(id) {
    let url = `/tp/deleteProduct/${id}`;
    window.location.href = url;
  }

  document.querySelectorAll(".edit-product").forEach(btn => {
    btn.addEventListener("click", () => {
      getProductData(btn.dataset.update, btn.dataset.description, btn.dataset.component, btn.dataset.price, btn.dataset.idbrand); //btn.dataset.description solo guarda la primer palabra
    });
  });


  function getProductData(id, description, component, price, idBrand) {
    document.querySelector("#product").value = component;
    document.querySelector("#price").value = price;
    document.querySelector("#brand").value = idBrand;
    document.querySelector("#description").value = description;

    document.querySelector("#edit-btn-product").addEventListener("click", () => {
      editProduct(id);
    });
  }
  // document.getElementById('btn-on').classList.('newclass');


  function editProduct(id) {
    let form = document.querySelector(".product-form");
    let data = new FormData(form);
    let url = `/tp/editProduct/${id}/${data.get('product')}/${data.get('description')}/${data.get('price')}/${data.get('brand')}`;
    window.location.href = url;

  }


  // Brands

  // Delete
  document.querySelectorAll(".delete-brand").forEach(btn => {
    btn.addEventListener("click", () => {
      deleteBrand(btn.dataset.delete);
    });
  });

  function deleteBrand(id) {
    let url = `/tp/deleteBrand/${id}`;
    window.location.href = url;
  }


  document.querySelectorAll(".get-brand-data").forEach(btn => {
    btn.addEventListener("click", () => {
      getBrandData(btn.dataset.update, btn.dataset.name);
    });
  });

  function getBrandData(id, name) {
    document.querySelector("#brand-name").value = name;

    document.querySelector("#edit-brand").addEventListener("click", () => {
      editBrand(id);
    });

  }

function editBrand(id){
  let form = document.querySelector(".brand-form");
  let data = new FormData(form);
  console.log(data.get('brand'));
  let url = `/tp/editBrand/${id}/${data.get('brand')}`;
  window.location.href = url;
}






});