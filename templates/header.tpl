<!DOCTYPE html>
<html lang="en">
<head> 
    <base href="{BASE_URL}"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">     
     <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="home"><i class="bi bi-laptop"></i></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="home">Productos <span class="sr-only">(current)</span></a>
            </li>            
              <li id="nav-admin" class="nav-item hide">
              <a class="nav-link" href="admins">Administrador</a>
            </li>             
          </ul>
        </div>
        <div>
         <form method="POST" action="signIn">         
            <input name="email" placeholder="email" type="email" required>
            <input name="password" placeholder="Contraseña" type="password" required>
            <button id="sign-in" type="submit">Ingresar</button>
        </form>       
        </div>  
        <div>
        <h5>{$user}</h5>
        </div>
      </nav>