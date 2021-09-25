
<!DOCTYPE html>
<html lang="en">
<head> 
    <base href="{BASE_URL}"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$error}</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
     <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="main-error-container">
  <div class="advetising-logo"> 
        <i class="bi bi-exclamation-triangle-fill"></i> 
  </div>
  <div>
     <h1>{$error}</h1>
  </div>
  <div>
    <h3>{$message}</h3> 
  </div>
  <div>
    <button id="back-admin" type="button" class="btn btn-primary btn-lg">Volver</button>
 </div>  
</div>

<script type="text/javascript" src="js/errorAdmin.js"></script>
</body>
</html>