
{include file='templates/header.tpl'} 

<div class="main-product-list-container">
   <div class="filters-container">
   <form action="" method="post">
        <label for="brand">Filtro de marcas </label>
                    <select name ="brand">
                        <option  value='allbrands'>Todas las marcas</option>         
                        {foreach from=$brands item=$brand}                     
                           <option  value={$brand->id_brand}>{$brand->brand_name}</option>        
                        {/foreach}        
                    </select> 
   <input type="submit" name="submit" >
</form>              
   </div>
   <div>
      <table class="table table-striped">
         <thead>
            <tr>
               <th scope="col">*</th>
               <th scope="col">First</th>
               <th scope="col">Last</th>
               <th scope="col">Handle</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <th scope="row">1</th>
               <td>Mark</td>
               <td>Otto</td>
               <td>@mdo</td>
            </tr>
            <tr>
               <th scope="row">2</th>
               <td>Jacob</td>
               <td>Thornton</td>
               <td>@fat</td>
            </tr>
            <tr>
               <th scope="row">3</th>
               <td>Larry</td>
               <td>the Bird</td>
               <td>@twitter</td>
            </tr>
         </tbody>
      </table>
   </div>
</div>

<ul>

{foreach from=$products item=$product}
   <li>{$product->component}, {$product->price} </li> 
{/foreach}
</ul>



{include file='templates/footer.tpl'}