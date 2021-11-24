
{include file='templates/header.tpl'} 
{include file='templates/nav.tpl'} 

<div class="main-container">
    <div class="admin-tables">
        <div class="product-table-container">
            <table id = "product-table" class="table table-striped table-dark">
                <thead>
                    <tr>       
                        <th scope="col">Componente</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Precio</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$products item=$product}
                    <tr>     
                        <td>{$product->component}</td>
                        <td>{$product->brand_name}</td>
                        <td class="description-column">{$product->description}</td>
                        <td> $ {$product->price}</td>
                        <td>  
                        <a class="delete-product btn btn-danger" href="deleteProduct/{$product->id_product}"><i class="bi bi-trash"></i> Borrar</a>  
                        </td>
                        <td>
                        <button type="button" class="edit-product  btn btn-warning" data-price={$product->price} 
                            data-description="{$product->description }"
                            data-idbrand={$product->id_brand} data-component="{$product->component}" data-update={$product->id_product}><i class="bi bi-pencil"></i> Editar</button>                      
                        <td>
                         <a class="delete-imagen btn btn-danger" href="deleteImageProduct/{$product->id_product}"><i class="bi bi-trash"></i> Borrar imagen</a> 
                        </td

                    </tr>   
                    {/foreach}    
                </tbody>
            </table>
        </div>

        <!--brand table-->
       <div class="brand-table-container"> 
            <table id = "brand-table" class="table table-striped table-dark">
                <thead>
                    <tr>       
                        <th scope="col">Marca</th>
                        

                    </tr>
                </thead>
                <tbody>
                    {foreach from=$brands item=$brand}
                    <tr>     
                        <td >{$brand->brand_name}</td> 
                        <td class="edit-delete-brand-buttons">
                        <a class="delete-brand btn btn-danger"  href="deleteBrand/{$brand->id_brand}"><i class="bi bi-trash"></i> Borrar</a>                           
                            <button type="button" class="get-brand-data btn btn-warning" data-name={$brand->brand_name} data-update={$brand->id_brand}><i class="bi bi-pencil"></i>Editar</button>
                        </td>
                    </tr>   
                    {/foreach}    
                </tbody>
            </table>
       </div> 
    </div>  

    <div class="forms-container">

     <!--new product Form-->
        <form id="new-product-form" class="new-row-form product-form"  action="newProduct" method="POST"  class="needs-validation" enctype="multipart/form-data">
        <div>
            <h3 class="form-title">Cargar Producto</h3>
        </div>          
                <div class="col-md-10 mb-3">
                    <label for="product">Producto</label>
                    <input type="text"  name="product" class="form-control" id="validationTooltip01" placeholder="Ej.mouse" value="" required>      
                </div>
                <div class="col-md-10 mb-3">
                    <label for="price">Precio</label>
                    <input type="number"  name="price" class="form-control" id="validationTooltip02" placeholder="precio" value="" step="0.1" min="0" required>   
                </div>
                <div class="col-md-10 mb-3">
                    <label for="description">Descripcion</label>
                    <div class="input-group">       
                        <textarea type="text"  name="description" class="form-control" id="validationTooltipUsername"  placeholder="" aria-describedby="validationTooltipUsernamePrepend" ></textarea> 
                    </div>
                </div> 
                <div class="brand-container">
                    <label for="brand">Marca </label>
                    <select  name ="brand">       
                    {foreach from=$brands item=$brand}
                        <option  value={$brand->id_brand}>{$brand->brand_name}</option>        
                    {/foreach}        
                    </select>    
                </div>
                <div class="image-container">
                    <label for="image">Selecciona la imagen</label>
                    <input type="file" name="image" id="imageToUpload"> 
                </div>
                 <div class="form-btn-container">
                    <div class="btn-on">
                        <button  class="btn btn-success" type="submit">Cargar Producto</button>
                    </div>               
            </div>
        </form>

    <!--edit product Form-->
        <form id="edit-product-form" class="new-row-form product-form hide"  action="editProduct" method="POST"  class="needs-validation" enctype="multipart/form-data">
        <div>
            <h3 class="form-title">Editar Producto</h3>
        </div>          
                <div class="col-md-10 mb-3">
                    <label for="product">Producto</label>
                    <input type="text" id="product" name="product" class="form-control" id="validationTooltip01" placeholder="Ej.mouse" value="" required>      
                </div>
                <div class="col-md-10 mb-3">
                    <label for="price">Precio</label>
                    <input type="number" id="price" name="price" class="form-control" id="validationTooltip02" placeholder="precio" value="" step="0.1" min="0" required>   
                </div>
                <div class="col-md-10 mb-3">
                    <label for="description">Descripcion</label>
                    <div class="input-group">       
                        <textarea type="text" id="description" name="description" class="form-control" id="validationTooltipUsername"  placeholder="" aria-describedby="validationTooltipUsernamePrepend" required></textarea> 
                    </div>
                </div> 
                <div class="brand-container">
                    <label for="brand">Marca </label>
                    <select id="brand" name ="brand">       
                    {foreach from=$brands item=$brand}
                        <option  value={$brand->id_brand}>{$brand->brand_name}</option>        
                    {/foreach}        
                    </select>    
                </div>
                <div class="image-container">
                    <label for="image">Selecciona la imagen</label>
                    <input type="file" name="image" id="imageToUpload">
                </div>
                 <div class="form-btn-container">
                    <div class="btn-on">
                        <button id="idit-product-button" name="id" value="" class="btn btn-success" type="submit">Editar Producto</button>
                    </div>
                <div class="btn-off">
                    <button id="cancel-product-edit"  class="btn btn-light" type="button" >Cancelar</button>
                </div>
            </div>
        </form>  


            <!--new brand form-->

        <form id="new-brand-form" class="new-row-form brand-form brand-form"  action="newBrand" method="POST"  class="needs-validation" >
                <div>
                    <h3 class="form-title">Cargar Marca</h3>
                </div>          
                <div class="col-md-10 mb-3">
                    <label for="brand">Marca</label>
                    <input type="text" name="brand" class="form-control" id="validationTooltip01" placeholder="Ej.Lenovo" value="" required>      
                </div>               
                <div class="form-btn-container">
                    <div class="btn-on">
                        <button name="id" value="" class="btn btn-success" type="submit">Cargar Marca</button>
                    </div>                
                </div>
        </form>

        <form id="edit-brand-form" class="new-row-form brand-form hide"  action="editBrand" method="POST"  class="needs-validation" >
                <div>
                    <h3 class="form-title">Editar Marca</h3>
                </div>          
                <div class="col-md-10 mb-3">
                    <label for="brand">Marca</label>
                    <input type="text" id="brand-name" name="brand" class="form-control" id="validationTooltip01" placeholder="Ej.Lenovo" value="" required>      
                </div>               
                <div class="form-btn-container">
                    <div class="btn-on">
                        <button id="edit-brand" name="id" value="" class="btn btn-success" type="submit">Editar Marca</button>
                </div>
                <div  class="btn-off">
                    <button id="cancel-brand-edit" class="btn btn-light" type="button" >Cancelar</button>               
               </div>   
             </div>
        </form>

        <form id="new-product-form" class="new-row-form new-admin-form"  action="newAdmin" method="POST"  class="needs-validation" >
                <div>
                    <h3 class="form-title">Crear nuevo administrador</h3>
                </div>          
                <div class="col-md-10 mb-3">
                    <label for="email">Email</label>
                    <input type="email"  name="email" class="form-control" id="validationTooltip01" placeholder="email"  required>      
                </div>
                <div class="col-md-10 mb-3">
                    <label for="password">Password</label>
                    <input type="password"  name="password" class="form-control" id="validationTooltip02" placeholder="Password" required>   
                </div>
                 <div class="form-btn-container">
                    
                    <button  class="btn btn-success" type="submit">Crear administrador</button>
                         
                </div>
        </form>
    </div>    
  <!--brand table-->
       <div class="brand-table-container"> 
            <table id = "brand-table" class="table table-striped table-dark">
                <thead>
                    <tr>       
                        <th scope="col">email</th>                       
                        <th scope="col">rol</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$users item=$user}
                    <tr>                        
                        <td >{$user->email}</td> 
                       <td> {if $user->role==1} <a class=" btn btn-warning"  href="userRole/{$user->id_user}/0"> cambiar rol  a billing</a> {else} <a class="btn btn-danger"  href="userRole/{$user->id_user}/1"> cambiar rol a admin</a>{/if}</td>
                    </tr>   
                    {/foreach}    
                </tbody>
            </table>
       </div> 

        <!--brand table-->
       <div class="brand-table-container"> 
            <table id = "brand-table" class="table table-striped table-dark">
                <thead>
                    <tr>       
                        <th scope="col">email</th>                       
                        <th scope="col"></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$users item=$user}
                    <tr>                        
                        <td >{$user->email}</td> 
                       <td><a class=" btn btn-danger"  href="deleteUser/{$user->id_user}">Eliminar usuario</a> </td>
                    </tr>   
                    {/foreach}    
                </tbody>
            </table>
       </div> 
    </div>
</div>







<script type="text/javascript" src="js/admin.js"></script>


{include file='templates/footer.tpl'}