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
                <tbody id="comment-section">                                
                </tbody>
            </table>
        </div>
    </div>
 </div>

 <script type="text/javascript" src="js/adminDeleteComments.js"></script>
{include file='templates/footer.tpl'}