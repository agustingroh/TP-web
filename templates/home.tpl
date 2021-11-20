
{include file='templates/header.tpl'} 
{include file='templates/nav.tpl'} 


<div class="main-product-container">
   <aside class="product-menu">
     <div class="dropdown">
         <button  id="drop-btn">Nuestras marcas<span><i class="bi bi-caret-down-fill"></i></span></button>
            <div id="myDropdown" class="dropdown-content">
                 
                     <a href='home/allbrands'>Todas las marcas</a>
                 {foreach from=$brands item=$brand}  
                     <a  href="home/{$brand->id_brand}">{$brand->brand_name} </a>
                   {/foreach} 
            </div>
      </div>
   </aside>
   <div class="product-list-container">
    <table class="table table-striped">
         <thead>
            <tr>
               <th scope="col">Producto</th>
               <th scope="col">Marca</th>
               <th scope="col">Precio</th>               
            </tr>
         </thead>
         <tbody>
            {foreach from=$products item=$product}
               <tr>
                  <th scope="row"><a href="showProduct/{$product->id_product}"  data-toggle="tooltip" data-placement="top" title="Ver detalles"> {$product->component}</a></th>
                  <td >{$product->brand_name}</td>
                  <td>${$product->price}</td>
               </tr>
            {/foreach}
         </tbody>
      </table>

   <div class="pagination-container">
      <nav aria-label="Page navigation example">
         <ul class="pagination">
            {for $page=1 to {($count/5)|ceil}}          
               <li class="page-item"><a class="page-link" href="home/allbrands/5/{$page}">{$page}</a></li> 
            {/for}   
         </ul>
      </nav>
   </div>
     
   </div>

<div>



<script type="text/javascript" src="js/main.js"></script>
{include file='templates/footer.tpl'}

