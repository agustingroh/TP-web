
{include file='templates/header.tpl'} 

<div class="main-container">
    <div class="admin-table">
        <table class="table table-striped table-dark">
            <thead>
                <tr>       
                    <th scope="col">Componente</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Precio</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$products item=$product}
                <tr>     
                    <td>{$product->component}</td>
                    <td>{$product->name}</td>
                    <td>{$product->description}</td>
                    <td> $ {$product->price}</td>
                    <td><button type="button" class="delete" data-delete={$product->productId}  >Borrar</button> <button type="button" class="update" data-update={$product->productId}>Editar</button></td>
                </tr>   
                {/foreach}    
            </tbody>
        </table>
    </div>    

    <div class="new-product-form-container">        
        <form class="newProduct-form"  action="newProduct" method="POST"  class="needs-validation" >
        <div>
            <h3 class="form-title">Carga de producto</h3>
        </div>
          
                <div class="col-md-10 mb-3">
                    <label for="product">Producto</label>
                    <input type="text" name="product" class="form-control" id="validationTooltip01" placeholder="Ej.mouse" value="" required>      
                </div>
                <div class="col-md-10 mb-3">
                    <label for="price">Precio</label>
                    <input type="text" name="price" class="form-control" id="validationTooltip02" placeholder="precio" value="" required>   
                </div>
                <div class="col-md-10 mb-3">
                    <label for="description">Descripcion</label>
                    <div class="input-group">       
                        <textarea type="text" name="description" class="form-control" id="validationTooltipUsername" placeholder="" aria-describedby="validationTooltipUsernamePrepend" required> </textarea> 
                    </div>
                </div> 
                <div class="brand-container">
                    <label for="brand">Marca </label>
                    <select name ="brand">       
                    {foreach from=$brands item=$brand}
                        <option value={$brand->brandId}>{$brand->name}</option>        
                    {/foreach}        
                    </select>
    
                </div>

            <button class="btn btn-primary" type="submit">cargar producto</button>
        
        </form>
    </div>
</div>







<script type="text/javascript" src="js/admin.js"></script>


{include file='templates/footer.tpl'}