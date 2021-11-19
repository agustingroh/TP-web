{include file='templates/header.tpl'} 
{include file='templates/nav.tpl'} 
<div class="main-container">
    <div class="admin-tables">
        <div class="comment-table-container">
            <table id = "comment-table" class="table table-striped table-dark">
                <thead>
                    <tr>       
                        <th scope="col">Usuario</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Comentario</th>
                        <th scope="col">Puntuacion</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$comments item=$comment}
                    <tr>     
                        <td>{$comment->email}</td>
                        <td>{$comment->component}</td>
                        <td class="description-column">{$comment->comment}</td>
                        <td>{$comment->punctuation}</td>
                        <td>  
                        <a class="delete-product btn btn-danger" href="api/comment/{$product->id_product}"><i class="bi bi-trash"></i> Borrar</a> 
                        {* como pongo el method delete????????? *}
                        </td>
                    </tr>   
                    {/foreach}    
                </tbody>
            </table>
        </div>
    </div>
 </div>
{include file='templates/footer.tpl'}