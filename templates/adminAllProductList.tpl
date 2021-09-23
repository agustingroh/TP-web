
{include file='templates/header.tpl'} 

<div class="main-container">
    <div class="admin-table">
        <table id = "product-table" class="table table-striped table-dark">
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
                    <td >{$product->component}</td>
                    <td >{$product->name}</td>
                    <td >{$product->description}</td>
                    <td > $ {$product->price}</td>
                    <td>
                        <button type="button" class="delete" data-delete={$product->id_product} >Borrar</button> <button type="button" class="update" data-price={$product->price} 
                        data-description={($product->description != null ) ? $product->description : 'n/a' } 
                         data-idbrand={$product->id_brand} data-component={$product->component} data-update={$product->id_product}>Editar</button>
                    </td>
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
                    <input type="text" id="product" name="product" class="form-control" id="validationTooltip01" placeholder="Ej.mouse" value="" required>      
                </div>
                <div class="col-md-10 mb-3">
                    <label for="price">Precio</label>
                    <input type="text" id="price" name="price" class="form-control" id="validationTooltip02" placeholder="precio" value="" required>   
                </div>
                <div class="col-md-10 mb-3">
                    <label for="description">Descripcion</label>
                    <div class="input-group">       
                        <textarea type="text" id="description" name="description" class="form-control" id="validationTooltipUsername" value="" placeholder="" aria-describedby="validationTooltipUsernamePrepend" required> </textarea> 
                    </div>
                </div> 
                <div class="brand-container">
                    <label for="brand">Marca </label>
                    <select id="brand" name ="brand">       
                    {foreach from=$brands item=$brand}
                        <option  value={$brand->id_brand}>{$brand->name}</option>        
                    {/foreach}        
                    </select>
    
                </div>
            <div class="form-btn-container">
            <div class="btn-on">
            <button  class="btn btn-primary" type="submit">cargar producto</button>
            </div>
            <div  class="btn-off">
            <button id="edit-btn" type="button" >Editar producto</button>
            </div>
            </div>
        </form>
    </div>
</div>







<script type="text/javascript" src="js/admin.js"></script>


{include file='templates/footer.tpl'}