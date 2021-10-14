{include file='templates/header.tpl'} 
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
                    </ul>                    
                </div>
            </nav>
        </div>  
    </header>   
    <div class="registration-container">        
        <form method="POST" action="signIn">
        <h2>Iniciar sesion</h2>
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
                <a href="newAccount" role="button" >crear cuenta</a>    
             </div>            
            <div class="form-group">
                <button id="sign-in" class="btn btn-primary" type="submit">Ingresar</button>            
            </div> 
        </form> 
         <div>
            <p class="user-message">{$message}</p>
        </div>                        
    </div>        
</body>
</html>
 

 


