
{include file='templates/header.tpl'} 

<div class="specificationsContainer">
   <h1 class="product"> {$product->component}</h1>

   <div class="image">
   <img class="style-image" src = "img/no-pic.png">
  </div>

   <div class="brand">
      <h3 class="especificationView">Marca: </h3>
      <p> {$product->brand_name}</p>
   </div>

   <div class="description">
      <h3 class="especificationView">Descripcion: </h3>
      <p> {$product->description}</p>
   </div>

   <div class="price">
      <h3 class="especificationView">Precio: </h3>
      <p> ${$product->price}</p>
   </div> 

   <div class="cart">
      <a href="home" class="btn btn-primary"><i class="bi bi-search"></i> Seguir comprando </a>
   </div>
</div>



{include file='templates/footer.tpl'}