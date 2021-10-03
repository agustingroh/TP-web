<!DOCTYPE html>
<html lang="en">
<head>
    <base href="{BASE_URL}"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">    
     <link rel="stylesheet" href="css/styles.css">
     <title>Document</title>
</head>
<body>
    <header> 
        <div class="logo-brand-container">
        </div>
        <div class="nav-container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar navbar-dark bg-dark">
                <a class="navbar-brand" href="home"><i class="bi bi-laptop"></i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="home">Inicio<span class="sr-only">(current)</span></a>
                        </li>            
                        <li id="nav-admin" class="nav-item {if $userRole ==1} show {else} hide {/if} ">
                            <a class="nav-link" href="admins">Administrador</a>
                        </li>             
                    </ul>                    
                </div>
            </nav>
        </div> 
    </header>
    <div class="registration-container">
        <form method="POST" action="newUser">
        <h2>Nueva cuenta</h2>
            <div class="form-group">
                <label class="registration-label" for="email">Email</label>    
                    <input name="email"  class="form-control" placeholder="email" type="email" required>                    
                </div>
            <div class="form-group">
                <label class="registration-label" for="password">Contraseña</label>
                    <input name="password" class="form-control" placeholder="Contraseña" type="password" required>
                <small id="emailHelp" class="form-text text-muted">no compartas tu contraseña</small>
            </div>                   
            <div class="form-group">
                <button id="sign-in" class="btn btn-primary" type="submit">Crear cuenta</button>            
            </div> 
        </form>  
        <div>
            <p class="billing-user-message">{$message}</p>
        </div>            
    </div>        
</body>
</html>