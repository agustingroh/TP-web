document.addEventListener("DOMContentLoaded", function (e) {
  "use_strict";


  document.querySelectorAll(".edit-product").forEach(btn => {
    btn.addEventListener("click", () => {
      getProductData(btn.dataset.update, btn.dataset.description, btn.dataset.component, btn.dataset.price, btn.dataset.idbrand); 
    });
  });


  function getProductData(id, description, component, price, idBrand) {
    document.querySelector("#edit-product-form").classList.remove('hide');
    document.querySelector("#new-product-form").classList.add('hide');
    document.querySelector("#product").value = component;
    document.querySelector("#price").value = price;
    document.querySelector("#brand").value = idBrand;
    document.querySelector("#description").value = description; 
    document.querySelector("#idit-product-button").value=id;
  
  }


document.querySelector("#cancel-product-edit").addEventListener("click",cancelProductEdit);


function cancelProductEdit(){
  document.querySelector("#edit-product-form").classList.add('hide');
  document.querySelector("#new-product-form").classList.remove('hide');
}


  // Brands

  document.querySelectorAll(".get-brand-data").forEach(btn => {
    btn.addEventListener("click", () => {
      getBrandData(btn.dataset.update, btn.dataset.name);
    });
  });

  function getBrandData(id, name) {
    document.querySelector("#edit-brand-form").classList.remove('hide');
    document.querySelector("#new-brand-form").classList.add('hide');
    document.querySelector("#brand-name").value = name;
    document.querySelector("#edit-brand").value=id;
  }


  // cancel edition of brand
  document.querySelector("#cancel-brand-edit").addEventListener("click",cancelBrandEdit);
  function cancelBrandEdit(){
    document.querySelector("#edit-brand-form").classList.add('hide');
    document.querySelector("#new-brand-form").classList.remove('hide');
  }




});