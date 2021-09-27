
{include file='templates/header.tpl'} 

<div class="main-product-list-container">
   <div class="filters-container">
      <h3>Filtros </h3>
   </div>
   <div>
      <table class="table table-striped">
         <thead>
            <tr>
               <th scope="col">Producto</th>
               <th scope="col">Precio</th>
            </tr>
         </thead>
         <tbody>
            {foreach from=$products item=$product}
               <tr>
                  <th scope="row"><a href="showProduct/{$product->id_product}"> {$product->component}</a></th>
                  <td>{$product->price}</td>
               </tr>
            {/foreach}
         </tbody>
      </table>
   </div>
</div>

{include file='templates/footer.tpl'}