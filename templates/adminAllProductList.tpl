
{include file='templates/header.tpl'} 

<div>
<table class="table table-striped table-dark">
  <thead>
    <tr>       
      <th scope="col">componente</th>
       <th scope="col">marca</th>
      <th scope="col">descripcion</th>
      <th scope="col">precio</th>
    <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  {foreach from=$products item=$product}
    <tr>     
      <td>{$product->component}</td>
        <td>{$product->name}</td>
      <td>{$product->description}</td>
      <td> {$product->price}</td>
      <td><button type="button" class="delete" data-delete={$product->productId}  >Borrar</button> <button type="button" class="update" data-update={$product->productId}>Editar</button></td>
    </tr>   
{/foreach}    
  </tbody>
</table>

<div>
<form  action="newProduct" method="POST"  class="needs-validation" >
  <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="product">producto</label>
            <input type="text" name="product" class="form-control" id="validationTooltip01" placeholder="Ej.mouse" value="" required>      
        </div>
        <div class="col-md-4 mb-3">
            <label for="price">precio</label>
            <input type="text" name="price" class="form-control" id="validationTooltip02" placeholder="precio" value="" required>   
        </div>
        <div class="col-md-4 mb-3">
            <label for="description">descripcion</label>
            <div class="input-group">       
                <textarea type="text" name="description" class="form-control" id="validationTooltipUsername" placeholder="" aria-describedby="validationTooltipUsernamePrepend" required> </textarea> 
            </div>
        </div> 
  <div>
   <label for="brand">Marca </label>
   <select name ="brand">       
         {foreach from=$products item=$product}
             <option value={$product->brandId}>{$product->name}</option>        
        {/foreach}        
    </select>
    
  </div>

  <button class="btn btn-primary" type="submit">cargar producto</button>
 </div> 
</form>
</div>




<div>





<script type="text/javascript" src="js/admin.js"></script>


{include file='templates/footer.tpl'}