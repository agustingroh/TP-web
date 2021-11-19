
{include file='templates/header.tpl'} 
{include file='templates/nav.tpl'} 

<div class="specificationsContainer">
   <h1 class="product"> {$product->component}</h1>

   <div class="product-image">
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
   
    <div class="comment-container">     
         <div class="comment-title">
            <h4 class="productTitle" >Comentarios del producto</h4>
         </div>
         <div class="comment-area">
         </div>     
    </div>

    <div class="new-comment-container">
      <form  id="comment-form" action="api/comment" method="POST">
         <input id="user-comment" name="comment"  placeholder="Escriba su comentario del producto...">
         <select id="user-punctuation" name="puctuation">
            <option value="1" default=1 >1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
         </select>
      <button type="submit">Enviar comentario</button>
      </form>
    
    </div>

    
</div>




 <script type="text/javascript" src="js/comment.js"></script>

{include file='templates/footer.tpl'}