{include file='templates/header.tpl'} 

<body>
<div class="main-error-container">
  <div class="advetising-logo"> 
        <i class="bi bi-exclamation-triangle-fill"></i> 
  </div>

  <div>
    <h2>{$message}</h2> 
  </div>
  <div>
    <button id="back-admin" type="button" class="btn btn-primary btn-lg">Volver</button>
 </div>  
</div>

<script type="text/javascript" src="js/errorAdmin.js"></script>

{include file='templates/footer.tpl'}